use 5.008005;
use ExtUtils::MakeMaker 7.12; # for XSMULTI option

WriteMakefile(
  PREREQ_PM      => { 'ExtUtils::MakeMaker' => '7.12' },
  CCFLAGS        => '-Wall -std=c99',
  INC            => '-I/usr/lib/jvm/java-1.17.0-openjdk-amd64/include -I/usr/lib/jvm/java-1.17.0-openjdk-amd64/include/linux',
  LIBS           => ['-L/usr/lib/jvm/java-1.17.0-openjdk-amd64/lib/server/ -ljvm'],
  OPTIMIZE       => '-O3',
  XSMULTI        => 1,
);
