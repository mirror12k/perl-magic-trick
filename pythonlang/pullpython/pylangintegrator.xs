#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "code.c"


MODULE = pylangintegrator  PACKAGE = pylangintegrator
PROTOTYPES: ENABLE

void init_python()

void execute_python_string(char* str)

void execute_python_function(char* function_name, char* arg)


