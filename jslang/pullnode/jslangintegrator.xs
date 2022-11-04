#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

int init_js_vm();
int execute_js_code(char* js_code);

MODULE = jslangintegrator  PACKAGE = jslangintegrator
PROTOTYPES: ENABLE

void init_js_vm()

void execute_js_code(char* js_code)



