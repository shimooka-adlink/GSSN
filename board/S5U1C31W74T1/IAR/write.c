/*******************
 *
 * Copyright 1998-2010 IAR Systems AB.  
 *
 * This is a template implementation of the "__write" function used by
 * the standard library.  Replace it with a system-specific
 * implementation.
 *
 * The "__write" function should output "size" number of bytes from
 * "buffer" in some application-specific way.  It should return the
 * number of characters written, or _LLIO_ERROR on failure.
 *
 * If "buffer" is zero then __write should perform flushing of
 * internal buffers, if any.  In this case "handle" can be -1 to
 * indicate that all handles should be flushed.
 *
 * The template implementation below assumes that the application
 * provides the function "seUart_Putchar".  It should return the
 * character written, or -1 on failure.
 *
 ********************/
#include "settings.h"
#if  defined( UART_PRINTF ) 
#include <yfuns.h>
#include "se_common.h"
#include <S1C31W74.h>
#include "system_S1C31W74.h"
#include "se_uart2.h"
#include "board.h"

_STD_BEGIN

#pragma module_name = "?__write"


/*
 * If the __write implementation uses internal buffering, uncomment
 * the following line to ensure that we are called with "buffer" as 0
 * (i.e. flush) when the application terminates.
 */

size_t __dwrite(int handle, const unsigned char * buffer, size_t size) {
 
  size_t nChars = 0;

  if (buffer != 0) {
    /* This template only writes to "standard out" and "standard err",
      * for all other file handles it returns failure. */
    if ( ( handle == _LLIO_STDOUT ) || (handle == _LLIO_STDERR ) ) {
      
      nChars = size;
      for (/* Empty */; size > 0; --size) {
        if ( *buffer == '\n' ) {
          seUART2_putchar( '\r' );
        }
        seUART2_putchar( *buffer++ );
      } 
    }
    else {
        nChars = _LLIO_ERROR;
    }
  }
  else {
      /*
     * This means that we should flush internal buffers.  Since we
     * don't we just return.  ( "handle" == -1 means that all
     * handles should be flushed.)
     */
    nChars =  0;
  }

  return nChars;
}

size_t __write(int handle, const unsigned char * buffer, size_t size) {
 
  size_t nChars = 0;

  if (buffer != 0) {
    /* This template only writes to "standard out" and "standard err",
      * for all other file handles it returns failure. */
    if ( ( handle == _LLIO_STDOUT ) || (handle == _LLIO_STDERR ) ) {
      
      nChars = size;
      for (/* Empty */; size > 0; --size) {
        if ( *buffer == '\n' ) {
          seUART2_putchar( '\r' );
        }
        seUART2_putchar( *buffer++ );
      } 
    }
    else {
        nChars = _LLIO_ERROR;
    }
  }
  else {
      /*
     * This means that we should flush internal buffers.  Since we
     * don't we just return.  ( "handle" == -1 means that all
     * handles should be flushed.)
     */
    nChars =  0;
  }

  return nChars;
}

_STD_END
#endif
