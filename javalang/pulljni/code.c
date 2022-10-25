


/* Include the JNI header file */
#include <jni.h>
#include <stdio.h>


JavaVM *javaVM;
JNIEnv *jniEnv;


int init_jvm() {
	JavaVMOption jvmopt[1];
	jvmopt[0].optionString = "-Djava.class.path=./jbuild";

	JavaVMInitArgs vmArgs;
	vmArgs.version = JNI_VERSION_1_2;
	vmArgs.nOptions = 1;
	vmArgs.options = jvmopt;
	vmArgs.ignoreUnrecognized = JNI_TRUE;

	// Create the JVM
	long flag = JNI_CreateJavaVM(&javaVM, (void**)&jniEnv, &vmArgs);
	if (flag == JNI_ERR) {
		printf("Error creating VM. Exiting...\n");
		return 1;
	// } else {
	// 	printf("created VM!\n");
	}

	// jint ver = (*jniEnv)->GetVersion(jniEnv);
	// printf("version: %x\n", ver);

	return 0;
}

int call_jvm_class_method(char* classname, char* classmethod, char* arg) {
	jclass jcls = (*jniEnv)->FindClass(jniEnv, classname);
	if (jcls == NULL) {
		(*jniEnv)->ExceptionDescribe(jniEnv);
		(*javaVM)->DestroyJavaVM(javaVM);
		return 1;
	} else {
		jmethodID methodId = (*jniEnv)->GetStaticMethodID(jniEnv, jcls, classmethod, "(Ljava/lang/String;)V");
		if (methodId != NULL) {
			jstring str = (*jniEnv)->NewStringUTF(jniEnv, arg);
			(*jniEnv)->CallStaticVoidMethod(jniEnv, jcls, methodId, str);
			if ((*jniEnv)->ExceptionCheck(jniEnv)) {
				(*jniEnv)->ExceptionDescribe(jniEnv);
				(*jniEnv)->ExceptionClear(jniEnv);
			}
		}
	}

	return 0;
}

// int main() {
// 	// printf("hello jni?\n");

// 	if (init_jvm())
// 		return 1;
// 	return call_jvm_class_method("MyClass", "greet", "hello world!");
// }


