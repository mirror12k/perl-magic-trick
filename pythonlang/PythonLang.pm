package PythonLang;
use strict;
use warnings;

use feature 'say';



require XSLoader;

XSLoader::load('pylangintegrator');
pylangintegrator::init_python();



sub compile_python_code {

	my $code = shift // die;

	return "pylangintegrator::execute_python_string(q\@$code\@);";

	# foreach my $method ($code =~ /public\s+static\s+void\s+(\w+)\(/gs) {
	# 	eval qq/sub ::java::${classname}::$method {
	# 		jlangintegrator::call_jvm_class_method('$classname', '$method', \$_[0]);
	# 	}/;
	# 	say $@ if $@;
	# }

}


use Filter::Simple sub {
	$_ = compile_python_code($_);
};



1;
