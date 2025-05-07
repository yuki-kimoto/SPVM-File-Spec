package SPVM::File::Spec::Instance::Win32;



1;

=head1 Name

SPVM::File::Spec::Instance::Win32 - Implementation of File::Spec::Instance for Windows

=head1 Description

The File::Spec::Instance::Win32 class in L<SPVM> is an implementation of L<File::Spec::Instance|SPVM::File::Spec::Instance> for Windows.

=head1 Usage

  my $spec = File::Spec::Instance::Win32->new;
  my $file = $spec->catfile(["foo", "bar", "a.txt"]);

=head1 Super Class

L<File::Spec::Instance::Unix|SPVM::File::Spec::Instance::Unix>

=head1 Class Methods

=head2 new

C<static method new : File::Spec::Instance::Win32 ();>>

Creates a new L<File::Spec::Instance::Win32|SPVM::File::Spec::Instance::Win32> object, and returns it.

=head1 Instance Methods

=head2 devnull

C<method devnull : string ();>

Returns a string representation of the null device.

See L<File::Spec::Win32/"devnull"> for details.

=head2 tmpdir

C<method tmpdir : string ();>

Returns a string representation of the first existing directory.

See L<File::Spec::Win32/"tmpdir"> for details.

=head2 file_name_is_absolute

C<method file_name_is_absolute : int ($path : string);>

As of right now, this returns 2 if the path $path is absolute with a volume, 1 if it's absolute with no volume, 0 otherwise.

See L<File::Spec::Win32/"file_name_is_absolute"> for details.

=head2 catfile

C<method catfile : string ($parts : string[]);>

Concatenate one or more directory names and a filename $parts to form a complete path ending with a filename, and returns it.

See L<File::Spec::Win32/"catfile"> for details.

=head2 canonpath

C<method canonpath : string ($path : string);>

Returns a logical cleanup of a path from the path $path on Windows.

=head2 splitpath

C<method splitpath : string[] ($path : string, $nofile : int = 0);>

Splits a path into volume, directory, and filename portions, and returns them as an array.

See L<File::Spec::Win32/"splitpath"> for details.

=head2 splitdir

C<method splitdir : string[] ($path : string);>

Splits the path $path to directory portions, and return them as an array.

See L<File::Spec::Win32/"splitdir"> for details.

=head2 catpath

C<method catpath : string ($volume : string, $dir : string, $file : string);>

Takes volume, directory and file portions and returns an entire path.

See L<File::Spec::Win32/"catpath"> for details.

=head2 rootdir

C<method rootdir : string ();>

Returns a string representation of the root directory. "\" on Windows.

Currently, L<File::Spec::Win32> does not provide detailed documentation for this method.

=head2 path

C<method path : string[] ();>

Returns the environment variable C<PATH> as a array.

Currently, L<File::Spec::Win32> does not provide detailed documentation for this method.

=head2 catdir

C<method catdir : string ($dir_parts : string[]);>

Concatenates two or more directory names $parts to form a complete path ending with a directory, and returns it.

Currently, L<File::Spec::Win32> does not provide detailed documentation for this method.

=head2 rel2abs

C<method rel2abs : string ($path : string, $base : string = undef);>

Converts a relative path to an absolute path $path and an optional base path $base, and returns it.

Currently, L<File::Spec::Win32> does not provide detailed documentation for this method.

=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

