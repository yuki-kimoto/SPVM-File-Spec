use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use SPVM 'Fn';
use SPVM::File::Spec;

use File::Spec;

use SPVM 'File::Spec::Instance';
use SPVM 'File::Spec';
use SPVM 'Cwd';

use SPVM 'TestCase::File::Spec::Instance';
use SPVM 'TestCase::File::Spec::Instance::Unix';

my $api = SPVM::api();

my $start_memory_blocks_count = $api->get_memory_blocks_count();

# tmpdir
{
  SPVM::File::Spec->tmpdir
}

# Version
is($SPVM::File::Spec::VERSION, SPVM::Fn->get_version_string('File::Spec'));

SPVM::Fn->destroy_runtime_permanent_vars;

my $end_memory_blocks_count = $api->get_memory_blocks_count();
is($end_memory_blocks_count, $start_memory_blocks_count);

done_testing;
