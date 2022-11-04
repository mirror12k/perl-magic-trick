package JavaScript;
use strict;
use warnings;

use feature 'say';



require XSLoader;

XSLoader::load('jslangintegrator');
jslangintegrator::init_js_vm();



sub compile_javascript_code {
	my $code = shift // die;

	return "jslangintegrator::execute_js_code(q\@$code\@);";
}


use Filter::Simple sub {
	$_ = compile_javascript_code($_);
};



1;
