/*
 * Copyright (c) 2001-2003 Swedish Institute of Computer Science.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 *
 * Author: Adam Dunkels <adam@sics.se>
 *
 */
#include "tcpecho.h"

#include "lwip/opt.h"

#if LWIP_NETCONN

#include "lwip/sys.h"
#include "lwip/api.h"

/* AES and CRC functionality */
#include "aes.h"
#include "fsl_crc.h"
/*-----------------------------------------------------------------------------------*/

#define ECHOASCLIENT	(0)		/* To switch between K64F as server or client  0 - Server / 1 - Client*/
#define ECHO		    (0)     /* If you want to receive the echo data set this macrodefinition to 1, echo must be able/disable in socket application as well*/
#define COUNTER			(0)		/* To delay the transmition and reception of messages */

#if ECHOASCLIENT
static void tcpecho_thread(void *arg)
{
  struct netconn *conn, *newconn;
  err_t err;
  LWIP_UNUSED_ARG(arg);
  ip_addr_t IpAdd;
  u32_t counter = 50000000;

  InitCrc32(CRC0, 0xFFFFFFFFU);

  /* Create a new connection identifier. */
  conn = netconn_new(NETCONN_TCP);
  IP4_ADDR(&IpAdd, 192, 168, 0, 102);
  LWIP_ERROR("tcpecho: invalid conn", (conn != NULL), return;);
  err = netconn_connect(conn, &IpAdd, 7);

  while (1)
  {
    /* Process the new connection. */
    if (err == ERR_OK)
    {
      struct netbuf *buf;
      char send_data[] = {"Practica 1: AES & CRC32 implementation\n"};
      void *recv_data;
      u16_t send_len;
      u16_t recv_len;

      while(err == ERR_OK)
      {
    	  aes_send_task(send_data);
    	  err = netconn_write(conn, send_data, send_len, NETCONN_COPY);
#if ECHO
    	 err = netconn_recv(conn, &buf);
      	 netbuf_data(buf, &recv_data, &recv_len);
      	 aes_recv_task(recv_data, recv_len);
      	 PRINTF("%s", recv_data);
      	 aes_task(recv_data);
      	 PRINTF("%s", recv_data);
      	 netbuf_delete(buf);
#endif
#if COUNTER
      	 while(counter--)
      	 {
      		 asm("NOP");
      	 }
      	 counter = 50000000;
#endif
      }
      netconn_close(conn);
      netconn_delete(conn);
     }
    }
  }
#else
static void tcpecho_thread(void *arg)
{
  struct netconn *conn, *newconn;
  err_t err;
  LWIP_UNUSED_ARG(arg);
  uint32_t len_to_be_send = 0;

  /* Create a new connection identifier. */
  /* Bind connection to well known port number 7. */
#if LWIP_IPV6
  conn = netconn_new(NETCONN_TCP_IPV6);
  netconn_bind(conn, IP6_ADDR_ANY, 7);
#else /* LWIP_IPV6 */
  conn = netconn_new(NETCONN_TCP);
  netconn_bind(conn, IP_ADDR_ANY, 7);
#endif /* LWIP_IPV6 */
  LWIP_ERROR("tcpecho: invalid conn", (conn != NULL), return;);

  /* Tell connection to go into listening mode. */
  netconn_listen(conn);

  while (1) {

    /* Grab new connection. */
    err = netconn_accept(conn, &newconn);
    /*printf("accepted new connection %p\n", newconn);*/
    /* Process the new connection. */
    if (err == ERR_OK) {
      struct netbuf *buf;
      void *data;
      u16_t len;
      bool verify_data = false;

      while ((err = netconn_recv(newconn, &buf)) == ERR_OK) {
        /*printf("Recved\n");*/
        do {
        	netbuf_data(buf, &data, &len);
        	verify_data = aes_recv_task(data, len);
        	if(verify_data)
        	{
        		aes_send_task(data);
        		err = netconn_write(newconn, data, len, NETCONN_COPY);
        		PRINTF("--------------------------------------------------------------------------------------------------------------------------------\n");
        		PRINTF("\r\n");
        		verify_data = false;
        	}
        } while (netbuf_next(buf) >= 0);
        netbuf_delete(buf);
      }
      /*printf("Got EOF, looping\n");*/
      /* Close connection and discard connection identifier. */
      netconn_close(newconn);
      netconn_delete(newconn);
    }
  }
}
#endif
/*-----------------------------------------------------------------------------------*/
void
tcpecho_init(void)
{
  sys_thread_new("tcpecho_thread", tcpecho_thread, NULL, DEFAULT_THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);
}
/*-----------------------------------------------------------------------------------*/

#endif /* LWIP_NETCONN */
