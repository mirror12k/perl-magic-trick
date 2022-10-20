#define PERL_NO_GET_CONTEXT // we'll define thread context if necessary (faster)
#include "EXTERN.h"         // globals/constant import locations
#include "perl.h"           // Perl symbols, structures and constants definition
#include "XSUB.h"           // xsubpp functions and macros
#include <stdlib.h>         // rand()

#include "test.c"

// additional c code goes here

MODULE = one  PACKAGE = one
PROTOTYPES: ENABLE

 # XS code goes here

 # XS comments begin with " #" to avoid them being interpreted as pre-processor
 # directives

unsigned int
rand()

void somefun(SV * sv)
