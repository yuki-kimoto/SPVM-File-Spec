package SPVM::File::Spec::Instance::Unix;



1;

=head1 Name

SPVM::File::Spec::Instance::Unix - Implementation of File::Spec::Instance for Unix-like OSs

=head1 Description

File::Spec::Instance::Unix class in L<SPVM> is an implementation of L<File::Spec::Instance|SPVM::File::Spec::Instance> for Unix-like OSs such as Unix, Linux and Mac.

=head1 Usage

  use File::Spec::Instance::Unix;

  my $spec = File::Spec::Instance::Unix->new;
  my $file = $spec->catfile(["foo", "bar", "a.txt"]);

=head1 Super Class

L<File::Spec::Instance|SPVM::File::Spec::Instance>

=head1 Class Methods

=head2 new

C<static method new : File::Spec::Instance::Unix ();>>

Creates a new L<File::Spec::Instance::Unix|SPVM::File::Spec::Instance::Unix> object, and returns it.

=head1 Instance Methods

=head2 canonpath

C<method canonpath : string ($path : string);>

Returns a logical cleanup of a path from the path $path.

See L<File::Spec::Unix/"canonpath"> for details.

=head2 catdir

C<method catdir : string ($parts : string[]);>

Concatenates two or more directory names $parts to form a complete path ending with a directory, and returns it.

See L<File::Spec::Unix/"catdir"> for details.

=head2 catfile

C<method catfile : string ($parts : string[]);>

Concatenate one or more directory names and a filename $parts to form a complete path ending with a filename, and returns it.

See L<File::Spec::Unix/"catfile"> for details.

=head2 curdir

C<method curdir : string ();>

Returns a string representation of the current directory. "." on UNIX.

See L<File::Spec::Unix/"curdir"> for details.

=head2 devnull

C<method devnull : string ();>

Returns a string representation of the null device. "/dev/null" on UNIX.

See L<File::Spec::Unix/"devnull"> for details.

=head2 rootdir

C<method rootdir : string ();>

Returns a string representation of the root directory. "/" on UNIX.

See L<File::Spec::Unix/"rootdir"> for details.

=head2 tmpdir

C<method tmpdir : string ();>

Returns a string representation of the first writable directory from the following list or the current directory if none from the list are writable

See L<File::Spec::Unix/"tmpdir"> for details.

=head2 updir

C<method updir : string ();>

Returns a string representation of the parent directory. ".." on UNIX.

See L<File::Spec::Unix/"updir"> for details.

=head2 no_upwards

C<method no_upwards : string[] ($parts : string[]);>

Given a list of file names $parts, strip out those that refer to a parent directory, and returns them as an array. (Does not strip symlinks, only '.', '..', and equivalents.)

See L<File::Spec::Unix/"no_upwards"> for details.

=head2 file_name_is_absolute

C<method file_name_is_absolute : int ($path : string);>

Takes as argument a path $path and returns 1 if it is an absolute path. Otherwise returns 0.

See L<File::Spec::Unix/"file_name_is_absolute"> for details.

=head2 path

C<method path : string[] ();>

Returns the environment variable C<PATH> as a array.

See L<File::Spec::Unix/"path"> for details.

=head2 join

C<method join : string ($parts : string[]);>

The same as L</"catfile"> method.

See L<File::Spec::Unix/"join"> for details.

=head2 splitpath

C<method splitpath : string[] ($path : string, $no_file : int = 0);>

Splits a path $path into volume, directory, and filename portions, and returns them as an array.

See L<File::Spec::Unix/"splitpath"> for details.

=head2 splitdir

C<method splitdir : string[] ($path : string);>

Splits the path $path to directory portions, and return them as an array.

See L<File::Spec::Unix/"splitdir"> for details.

=head2 catpath

C<method catpath : string ($volume : string, $dir : string, $file : string);>

Takes volume $volume, directory $dir and file $file portions and returns an entire path.

See L<File::Spec::Unix/"catpath"> for details.

=head2 abs2rel

C<method abs2rel : string ($path : string, $base : string = undef);>

Takes a destination path $path and an optional base path $base returns a relative path from the base path to the destination path.

See L<File::Spec::Unix/"abs2rel"> for details.

=head2 rel2abs

C<method rel2abs : string ($path : string, $base : string = undef);>

Converts a relative path to an absolute path $path and an optional base path $base, and returns it.

See L<File::Spec::Unix/"rel2abs"> for details.

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

