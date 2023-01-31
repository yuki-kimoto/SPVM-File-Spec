use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use File::Spec;

use SPVM 'File::Spec';

use SPVM 'TestCase::File::Spec';
use SPVM 'TestCase::File::Spec::Unix';

ok(SPVM::TestCase::File::Spec->test);

ok(SPVM::File::Spec->new->devnull, File::Spec->devnull);

ok(SPVM::File::Spec->new->rootdir, File::Spec->rootdir);

ok(SPVM::File::Spec->new->updir, File::Spec->updir);

# no_upwards
{
  {
    my $dir_parts = ["foo", "", "..", ".", "..."];
    is_deeply(SPVM::File::Spec->new->no_upwards($dir_parts)->to_strings, [File::Spec->no_upwards(@$dir_parts)]);
  }
}

ok(SPVM::File::Spec->new->curdir, File::Spec->curdir);

# canonpath
{
  {
    my $path = "";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/../bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/../bar/../baz";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/./bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/./a/./bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "C:/foo/bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "//192.168.102.155/foo/bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "/foo";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }

  {
    my $path = "";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\..\\bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\..\\bar\\..\\baz";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\.\\bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\.\\a\\.\\bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "C:\\foo\\bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "\\\\192.168.102.155\\foo\\bar";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "\\foo";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }

  {
    my $path = "\\\\HOST\\SHARE\\";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "C:\\..\\..";
    is_deeply(SPVM::File::Spec->new->canonpath($path), File::Spec->canonpath($path));
  }
}

# file_name_is_absolute
{
  ok(SPVM::TestCase::File::Spec::Unix->file_name_is_absolute);
  
  # Unix
  {
    {
      my $path = '/foo';
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = 'foo';
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
  }
  
  # Windows
  {
    {
      my $path = "\\foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:\\";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:\\foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "a:\\foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "z:\\foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "A:\\foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "Z:\\foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "\\\\192.168.201.205";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "\\\\192.168.201.205\\";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "\\\\192.168.201.205\\foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "/foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:/";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:/foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "a:/foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "z:/foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "A:/foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "Z:/foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "//192.168.201.205";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "//192.168.201.205/";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "//192.168.201.205/foo";
      is(!!SPVM::File::Spec->new->file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
  }
}

ok(SPVM::TestCase::File::Spec::Unix->canonpath);

ok(SPVM::TestCase::File::Spec::Unix->catdir);

ok(SPVM::TestCase::File::Spec::Unix->catfile);

ok(SPVM::TestCase::File::Spec::Unix->no_upwards);

ok(SPVM::TestCase::File::Spec::Unix->join);

ok(SPVM::TestCase::File::Spec::Unix->catpath);

ok(SPVM::TestCase::File::Spec::Unix->splitpath);

ok(SPVM::TestCase::File::Spec::Unix->rel2abs);

ok(SPVM::TestCase::File::Spec::Unix->splitdir);

ok(SPVM::TestCase::File::Spec::Unix->abs2rel);

{
  is_deeply(SPVM::File::Spec->new->path->to_strings, [File::Spec->path]);
}

done_testing;
