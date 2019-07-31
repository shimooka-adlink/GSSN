/*******************
 *
 * Copyright 1998-2010 IAR Systems AB.  
 *
 * This is a template implementation of the "__read" function used by
 * the standard library.  Replace it with a system-specific
 * implementation.
 *
 * The "__read" function reads a number of bytes, at most "size" into
 * the memory area pointed to by "buffer".  It returns the number of
 * bytes read, 0 at the end of the file, or _LLIO_ERROR if failure
 * occurs.
 *
 * The template implementation below assumes that the application
 * provides the function "seUART2_getchar".  It should return a
 * character value, or -1 on failure.
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

#pragma module_name = "?__read"


size_t __read(int handle, unsigned char * buffer, size_t size)
{
  int nChars = 0;

  /* This template only reads from "standard in", for all other file
   * handles it returns failure. */
  if (handle == _LLIO_STDIN)
  {
    for (/* Empty */; size > 0; --size) {
      int c = seUART2_getchar();
      if (c < 0) {
        break;
      }
      *buffer++ = c;
      ++nChars;
    }
  } else {
      nChars =  _LLIO_ERROR;
  }

  return nChars;
}
 _STD_END
#endif

