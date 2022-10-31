#define PY_SSIZE_T_CLEAN
#include <Python.h>

void init_python()
{
    // wchar_t *program = Py_DecodeLocale(argv[0], NULL);
    // if (program == NULL) {
    //     fprintf(stderr, "Fatal error: cannot decode argv[0]\n");
    //     exit(1);
    // }
    // Py_SetProgramName(program);  /* optional but recommended */
    Py_Initialize();

    // if (Py_FinalizeEx() < 0) {
    //     exit(120);
    // }
    // PyMem_RawFree(program);
}

void execute_python_string(char* str) {
    PyRun_SimpleString(str);
}

void execute_python_function(char* function_name, char* arg) {
    char function_call_string [4096];
    function_call_string[0] = '\0';

    sprintf(function_call_string, "%s(\'%s\')", function_name, arg);
    PyRun_SimpleString(function_call_string);
}

