use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use File::Spec;

use SPVM 'File::Spec';

use SPVM 'TestCase::File::Spec';

ok(SPVM::TestCase::File::Spec->test);

ok(SPVM::File::Spec->new->devnull, File::Spec->devnull);

ok(SPVM::File::Spec->new->rootdir, File::Spec->rootdir);

done_testing;
