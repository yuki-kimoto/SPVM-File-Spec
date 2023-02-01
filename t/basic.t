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

ok(SPVM::File::Spec->new->SPVM::File::Spec::devnull, File::Spec->devnull);

ok(SPVM::File::Spec->new->SPVM::File::Spec::rootdir, File::Spec->rootdir);

ok(SPVM::File::Spec->new->SPVM::File::Spec::updir, File::Spec->updir);

# no_upwards
{
  {
    my $dir_parts = ["foo", "", "..", ".", "..."];
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::no_upwards($dir_parts)->to_strings, [File::Spec->no_upwards(@$dir_parts)]);
  }
}

ok(SPVM::File::Spec->new->SPVM::File::Spec::curdir, File::Spec->curdir);

# canonpath
{
  {
    my $path = "";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/../bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/../bar/../baz";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/./bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo/./a/./bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "C:/foo/bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "//192.168.102.155/foo/bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "/foo";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }

  {
    my $path = "";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\..\\bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\..\\bar\\..\\baz";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\.\\bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "foo\\.\\a\\.\\bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "C:\\foo\\bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "\\\\192.168.102.155\\foo\\bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "\\foo";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }

  {
    my $path = "\\\\HOST\\SHARE\\";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
  {
    my $path = "C:\\..\\..";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::canonpath($path), File::Spec->canonpath($path));
  }
}

# file_name_is_absolute
{
  ok(SPVM::TestCase::File::Spec::Unix->file_name_is_absolute);
  
  # Unix
  {
    {
      my $path = '/foo';
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = 'foo';
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
  }
  
  # Windows
  {
    {
      my $path = "\\foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:\\";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:\\foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "a:\\foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "z:\\foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "A:\\foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "Z:\\foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "\\\\192.168.201.205";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "\\\\192.168.201.205\\";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "\\\\192.168.201.205\\foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "/foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:/";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "C:/foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "a:/foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "z:/foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "A:/foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "Z:/foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "//192.168.201.205";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "//192.168.201.205/";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
    {
      my $path = "//192.168.201.205/foo";
      is(!!SPVM::File::Spec->new->SPVM::File::Spec::file_name_is_absolute($path), !!File::Spec->file_name_is_absolute($path));
    }
  }
}

# splitdir
{
  {
    my $path = "foo/bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitdir($path)->to_strings, [File::Spec->splitdir($path)]);
  }
  {
    my $path = "/a/b/c//d/";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitdir($path)->to_strings, [File::Spec->splitdir($path)]);
  }
  {
    my $path = "foo\\bar";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitdir($path)->to_strings, [File::Spec->splitdir($path)]);
  }
  {
    my $path = "\\a\\b\\c\\\\d\\";
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitdir($path)->to_strings, [File::Spec->splitdir($path)]);
  }
}

# splitpath
{
  {
    my $path = "foo/bar";
    my $no_file = 0;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "/foo/bar/";
    my $no_file = 0;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "c:/foo/bar";
    my $no_file = 0;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "//1.2.3.4/SHARE/foo/bar";
    my $no_file = 0;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "foo/bar";
    my $no_file = 1;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "c:/foo/bar";
    my $no_file = 1;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "/foo/bar/";
    my $no_file = 1;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "//1.2.3.4/SHARE/foo/bar";
    my $no_file = 1;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "foo\\bar";
    my $no_file = 0;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "\\foo\\bar\\";
    my $no_file = 0;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "c:\\foo\\bar";
    my $no_file = 0;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "\\\\1.2.3.4\\SHARE\\foo\\bar";
    my $no_file = 0;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "foo\\bar";
    my $no_file = 1;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "c:\\foo\\bar";
    my $no_file = 1;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "\\foo\\bar\\";
    my $no_file = 1;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
  {
    my $path = "\\\\1.2.3.4\\SHARE\\foo\\bar";
    my $no_file = 1;
    is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::splitpath($path, $no_file)->to_strings, [File::Spec->splitpath($path, $no_file)]);
  }
}

# catdir
{
  {
    my $dir_parts = ["foo", "bar"];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }
  {
    my $dir_parts = [];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }
  {
    my $dir_parts = ["", "foo", "bar"];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }

  {
    my $dir_parts = ["c:", "bar"];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }
  {
    my $dir_parts = ["//1.2.3.4/SHARE", "bar"];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }
  {
    my $dir_parts = ["foo", "bar"];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }
  {
    my $dir_parts = [];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }
  {
    my $dir_parts = ["", "foo", "bar"];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }

  {
    my $dir_parts = ["c:", "bar"];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }
  {
    my $dir_parts = ["\\\\\\\\1.2.3.4\\\\SHARE", "bar"];
    is(SPVM::File::Spec->new->SPVM::File::Spec::catdir($dir_parts), File::Spec->catdir(@$dir_parts));
  }
}

# catfile
{
  {
    my $dir_parts = ["foo", "bar"];
    my $file_base_name = "a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::catfile($dir_parts, $file_base_name), File::Spec->catfile(@$dir_parts, $file_base_name));
  }
  {
    my $dir_parts = [];
    my $file_base_name = "a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::catfile($dir_parts, $file_base_name), File::Spec->catfile(@$dir_parts, $file_base_name));
  }
  {
    my $dir_parts = ["foo"];
    my $file_base_name = "a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::catfile($dir_parts, $file_base_name), File::Spec->catfile(@$dir_parts, $file_base_name));
  }
  {
    my $dir_parts = ["foo"];
    my $file_base_name = "p/../a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::catfile($dir_parts, $file_base_name), File::Spec->catfile(@$dir_parts, $file_base_name));
  }
  {
    my $dir_parts = ["foo"];
    my $file_base_name = "p\\..\\a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::catfile($dir_parts, $file_base_name), File::Spec->catfile(@$dir_parts, $file_base_name));
  }
}


# join
{
  {
    my $dir_parts = ["foo", "bar"];
    my $file_base_name = "a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::join($dir_parts, $file_base_name), File::Spec->join(@$dir_parts, $file_base_name));
  }
  {
    my $dir_parts = [];
    my $file_base_name = "a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::join($dir_parts, $file_base_name), File::Spec->join(@$dir_parts, $file_base_name));
  }
  {
    my $dir_parts = ["foo"];
    my $file_base_name = "a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::join($dir_parts, $file_base_name), File::Spec->join(@$dir_parts, $file_base_name));
  }
  {
    my $dir_parts = ["foo"];
    my $file_base_name = "p/../a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::join($dir_parts, $file_base_name), File::Spec->join(@$dir_parts, $file_base_name));
  }
  {
    my $dir_parts = ["foo"];
    my $file_base_name = "p\\..\\a.txt";
    is(SPVM::File::Spec->new->SPVM::File::Spec::join($dir_parts, $file_base_name), File::Spec->join(@$dir_parts, $file_base_name));
  }
}


# catpath
{
  {
    my $volume = "A:";
    my $dir = "foo";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "a:";
    my $dir = "foo";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "A:";
    my $dir = "foo";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "Z:";
    my $dir = "foo";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "A:/";
    my $dir = "foo/";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "//1.2.3.4/SHARE";
    my $dir = "foo/";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "A:";
    my $dir = "foo";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "a:";
    my $dir = "foo";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "A:";
    my $dir = "foo";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "Z:";
    my $dir = "foo";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "A:\\";
    my $dir = "foo\\";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
  }
  {
    my $volume = "\\\\1.2.3.4\\SHARE";
    my $dir = "foo\\";
    my $file_base_name = "a.txt";
    
    is(SPVM::File::Spec->new->SPVM::File::Spec::catpath($volume, $dir, $file_base_name), File::Spec->catpath($volume, $dir, $file_base_name));
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
  is_deeply(SPVM::File::Spec->new->SPVM::File::Spec::path->to_strings, [File::Spec->path]);
}

done_testing;
