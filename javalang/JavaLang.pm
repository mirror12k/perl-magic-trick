package JavaLang;
use strict;
use warnings;

use feature 'say';





require XSLoader;

XSLoader::load('jlangintegrator');

jlangintegrator::init_jvm();

`rm -f jbuild/*`;

sub writefile { IO::File->new(shift, 'w')->write(shift); }

sub compile_java_code {

	my $code = shift // die;

	mkdir 'jbuild';

	my ($classname) = ($code =~ m/public class (\w+)/);

	writefile("jbuild/$classname.java", $code);
	`javac jbuild/$classname.java`;

	foreach my $method ($code =~ /public\s+static\s+void\s+(\w+)\(/gs) {
		eval qq/sub ::java::${classname}::$method {
			jlangintegrator::call_jvm_class_method('$classname', '$method', \$_[0]);
		}/;
		say $@ if $@;
	}

}


use Filter::Simple sub {
	compile_java_code($_);
	$_ = '';
};



1;
