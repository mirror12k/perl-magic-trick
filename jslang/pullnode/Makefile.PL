use 5.008005;
use ExtUtils::MakeMaker 7.12; # for XSMULTI option

WriteMakefile(
  PREREQ_PM      => { 'ExtUtils::MakeMaker' => '7.12' },
  CCFLAGS        => '-Wall -std=c99',
  INC            => '-I/usr/local/include/node/',
  # LDFROM => 'code.o',
  # OBJECT => '$(OBJECT)',
  # C => [ 'code.c' ],
  LIBS           => '-L. -lcode',
  # LIBS           => '-L/usr/local/lib/ -L/usr/lib/x86_64-linux-gnu/ -luv -lnode -Wl,--no-as-needed -lstdc++ -lc++abi -lm -Wl,code.o -Wl,-rpath,/usr/local/lib/ -fPIC',
  OPTIMIZE       => '-O3',
  XSMULTI        => 1,
  # XSOPT => '-C++',
  # CC              => 'g++',
);
