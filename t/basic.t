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

ok(SPVM::File::Spec->new->curdir, File::Spec->curdir);

ok(SPVM::TestCase::File::Spec::Unix->canonpath);

ok(SPVM::TestCase::File::Spec::Unix->catdir);

ok(SPVM::TestCase::File::Spec::Unix->catfile);

ok(SPVM::TestCase::File::Spec::Unix->no_upwards);

ok(SPVM::TestCase::File::Spec::Unix->file_name_is_absolute);

ok(SPVM::TestCase::File::Spec::Unix->join);

ok(SPVM::TestCase::File::Spec::Unix->catpath);

ok(SPVM::TestCase::File::Spec::Unix->splitpath);

ok(SPVM::TestCase::File::Spec::Unix->rel2abs);

ok(SPVM::TestCase::File::Spec::Unix->splitdir);

ok(SPVM::TestCase::File::Spec::Unix->abs2rel);

done_testing;
