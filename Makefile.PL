use 5.008_007;
use ExtUtils::MakeMaker;
use strict;
use warnings;
use Config;
use Getopt::Long 'GetOptions';

GetOptions(
  'meta' => \my $meta,
  'no-build-spvm-modules' => \my $no_build_spvm_modules,
);

if ($meta) {
  $no_build_spvm_modules = 1;
}

unless ($meta) {
  # Do something such as environment check.
}

my %spvm_requires = ('SPVM' => '0.990042');
WriteMakefile(
  NAME              => 'SPVM::File::Spec',
  VERSION_FROM      => 'lib/SPVM/File/Spec.pm',
  LICENSE           => 'mit',
  ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
    (ABSTRACT_FROM  => 'lib/SPVM/File/Spec.pm',
     AUTHOR         => 'Yuki Kimoto<kimoto.yuki@gmail.com>') : ()),
  test => {TESTS => 't/*.t t/*/*.t t/*/*/*.t'},
  clean => {FILES => ['.spvm_build', 't/.spvm_build']},
  META_MERGE => {
    'meta-spec' => { version => 2 },
    resources => {
      repository => {
        type => 'git',
        url  => 'https://github.com/yuki-kimoto/SPVM-File-Spec.git',
        web  => 'https://github.com/yuki-kimoto/SPVM-File-Spec',
      },
    },
    no_index => {
      directory => [],
    }
  },
  NORECURS => 1,
  CONFIGURE_REQUIRES => {
    %spvm_requires,
  },
  PREREQ_PM         => {
    %spvm_requires,
    'SPVM::Sys' => '0.538',
    'SPVM::Regex' => '0.246',
  },
  TEST_REQUIRES => {
  },
);

sub MY::postamble {

  my $make_rule = '';
  
  unless ($no_build_spvm_modules) {
    require SPVM::Builder::Util::API;
    
    
    
  }
  
  return $make_rule;
}

1;
