#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "code.c"


MODULE = jlangintegrator  PACKAGE = jlangintegrator
PROTOTYPES: ENABLE

int init_jvm()

int call_jvm_class_method(char* classname, char* classmethod, char* arg)


