use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use SPVM 'TestCase::File::Spec::Cwd';
use SPVM 'File::Spec::Cwd';

use Cwd 'getcwd';

# getcwd
{
  my $cur_dir_expected = getcwd;
  ok(SPVM::TestCase::File::Spec::Cwd->getcwd($cur_dir_expected));
}

# getdcwd
if ($^O eq 'MSWin32') {
  my $cur_dir = Cwd::getdcwd();
  ok(SPVM::TestCase::File::Spec::Cwd->getdcwd($cur_dir));
}

# realpath, abs_path
{
  {
    my $path = 't/basic.t';
    my $realpath = SPVM::File::Spec::Cwd->realpath($path);
    my $realpath_expected = Cwd::realpath($path);
    warn "Got:$realpath, Expected:$realpath_expected";
    is($realpath, $realpath_expected);
  }
  {
    my $path = 't/lib/../basic.t';
    my $realpath = SPVM::File::Spec::Cwd->realpath($path);
    my $realpath_expected = Cwd::realpath($path);
    warn "Got:$realpath, Expected:$realpath_expected";
    is($realpath, $realpath_expected);
  }
  {
    my $path = 't';
    my $realpath = SPVM::File::Spec::Cwd->realpath($path);
    my $realpath_expected = Cwd::realpath($path);
    warn "Got:$realpath, Expected:$realpath_expected";
    is($realpath, $realpath_expected);
  }
  {
    my $path = 't/';
    my $realpath = SPVM::File::Spec::Cwd->realpath($path);
    my $realpath_expected = Cwd::realpath($path);
    warn "Got:$realpath, Expected:$realpath_expected";
    is($realpath, $realpath_expected);
  }
  {
    my $path = 't//';
    my $realpath = SPVM::File::Spec::Cwd->realpath($path);
    my $realpath_expected = Cwd::realpath($path);
    warn "Got:$realpath, Expected:$realpath_expected";
    is($realpath, $realpath_expected);
  }
  {
    my $path = '/';
    my $realpath = SPVM::File::Spec::Cwd->realpath($path);
    my $realpath_expected = Cwd::realpath($path);
    warn "Got:$realpath, Expected:$realpath_expected";
    is($realpath, $realpath_expected);
  }
  {
    my $path = "$FindBin::Bin";
    my $realpath = SPVM::File::Spec::Cwd->realpath($path);
    my $realpath_expected = Cwd::realpath($path);
    warn "Got:$realpath, Expected:$realpath_expected";
    is($realpath, $realpath_expected);
  }
  
  if ($^O eq 'MSWin32') {
    {
      my $path = "t\\basic.t";
      my $realpath = SPVM::File::Spec::Cwd->realpath($path);
      my $realpath_expected = Cwd::realpath($path);
      warn "Got:$realpath, Expected:$realpath_expected";
      is($realpath, $realpath_expected);
    }
    {
      my $path = "t\\lib\\..\\basic.t";
      my $realpath = SPVM::File::Spec::Cwd->realpath($path);
      my $realpath_expected = Cwd::realpath($path);
      warn "Got:$realpath, Expected:$realpath_expected";
      is($realpath, $realpath_expected);
    }
    {
      my $path = "t";
      my $realpath = SPVM::File::Spec::Cwd->realpath($path);
      my $realpath_expected = Cwd::realpath($path);
      warn "Got:$realpath, Expected:$realpath_expected";
      is($realpath, $realpath_expected);
    }
    {
      my $path = "t\\";
      my $realpath = SPVM::File::Spec::Cwd->realpath($path);
      my $realpath_expected = Cwd::realpath($path);
      warn "Got:$realpath, Expected:$realpath_expected";
      is($realpath, $realpath_expected);
    }
    {
      my $path = "t\\\\";
      my $realpath = SPVM::File::Spec::Cwd->realpath($path);
      my $realpath_expected = Cwd::realpath($path);
      warn "Got:$realpath, Expected:$realpath_expected";
      is($realpath, $realpath_expected);
    }
    {
      my $path = '\\';
      my $realpath = SPVM::File::Spec::Cwd->realpath($path);
      my $realpath_expected = Cwd::realpath($path);
      warn "Got:$realpath, Expected:$realpath_expected";
      is($realpath, $realpath_expected);
    }
  }
}

# abs_path
{
  {
    my $path = 't/lib/../basic.t';
    my $abs_path = SPVM::File::Spec::Cwd->abs_path($path);
    like($abs_path, qr|\Qt/basic.t|);
    my $realpath = SPVM::File::Spec::Cwd->realpath($path);
    is($abs_path, $realpath);
  }
}

done_testing;
