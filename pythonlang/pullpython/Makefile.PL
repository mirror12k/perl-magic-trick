use 5.008005;
use ExtUtils::MakeMaker 7.12; # for XSMULTI option

WriteMakefile(
  PREREQ_PM      => { 'ExtUtils::MakeMaker' => '7.12' },
  CCFLAGS        => '-Wall -std=c99',
  INC            => `python3.10-config --cflags`,
  LIBS           => `python3.10-config --ldflags` . ' -fPIE -lpython3.10',
  OPTIMIZE       => '-O3',
  XSMULTI        => 1,
);
