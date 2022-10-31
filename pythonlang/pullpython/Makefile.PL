use 5.008005;
use ExtUtils::MakeMaker 7.12; # for XSMULTI option

WriteMakefile(
  PREREQ_PM      => { 'ExtUtils::MakeMaker' => '7.12' },
  CCFLAGS        => '-Wall -std=c99',
  INC            => `python3.8-config --cflags`,
  LIBS           => `python3.8-config --ldflags` . ' -fPIE -lpython3.8',
  OPTIMIZE       => '-O3',
  XSMULTI        => 1,
);
