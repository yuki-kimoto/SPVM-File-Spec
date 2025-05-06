package SPVM::File::Spec::Instance;

1;

=head1 Name

SPVM::File::Spec::Instance - Object-Oriented Version of File::Spec class

=head1 Description

File::Spec::Instance class in L<SPVM> is the object-oriented version of L<File::Spec|SPVM::File::Spec> class.

=head1 Details

This class is an abstract class. The object of this class cannot be created.

=head1 Usage

  use File::Spec::Instance;
  
  my $spec = File::Spec::Instance->new;
  my $file = $spec->catfile(["foo", "bar", "a.txt"]);

=head1 Class Methods

C<static method new : File::Spec::Instance ();>

Create a new object of a child class of L<File::Spec::Instance|SPVM::File::Spec::Instance> class, and returns it.

If L<Sys::OS#is_windows|SPVM::Sys::OS/"is_windows"> method returns a true value,
creates a L<File::Spec::Instance::Win32|SPVM::File::Spec::Instance::Win32> object.

Otherwise, creates a L<File::Spec::Instance::Unix|SPVM::File::Spec::Instance::Unix> object.

=head1 Instance Methods

=head2 canonpath

C<static method canonpath : string ($path : string);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#canonpath|SPVM::File::Spec::Instance::Unix/"canonpath"> method.

For case Windows, see L<File::Spec::Instance::Win32#canonpath|SPVM::File::Spec::Instance::Win32/"canonpath"> method.

=head2 catdir

C<static method catdir : string ($parts : string[]);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#catdir|SPVM::File::Spec::Instance::Unix/"catdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#catdir|SPVM::File::Spec::Instance::Win32/"catdir"> method.

=head2 catfile

C<static method catfile : string ($parts : string[]);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#catfile|SPVM::File::Spec::Instance::Unix/"catfile"> method.

For case Windows, see L<File::Spec::Instance::Win32#catfile|SPVM::File::Spec::Instance::Win32/"catfile"> method.

=head2 curdir

C<static method curdir : string ();>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#curdir|SPVM::File::Spec::Instance::Unix/"curdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#curdir|SPVM::File::Spec::Instance::Win32/"curdir"> method.

=head2 devnull

C<static method devnull : string ();>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#devnull|SPVM::File::Spec::Instance::Unix/"devnull"> method.

For case Windows, see L<File::Spec::Instance::Win32#devnull|SPVM::File::Spec::Instance::Win32/"devnull"> method.

=head2 rootdir

C<static method rootdir : string ();>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#rootdir|SPVM::File::Spec::Instance::Unix/"rootdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#rootdir|SPVM::File::Spec::Instance::Win32/"rootdir"> method.

=head2 tmpdir

C<static method tmpdir : string ();>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#tmpdir|SPVM::File::Spec::Instance::Unix/"tmpdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#tmpdir|SPVM::File::Spec::Instance::Win32/"tmpdir"> method.

=head2 updir

C<static method updir : string ();>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#updir|SPVM::File::Spec::Instance::Unix/"updir"> method.

For case Windows, see L<File::Spec::Instance::Win32#updir|SPVM::File::Spec::Instance::Win32/"updir"> method.

=head2 no_upwards

C<static method no_upwards : string[] ($parts : string[]);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#updir|SPVM::File::Spec::Instance::Unix/"updir"> method.

For case Windows, see L<File::Spec::Instance::Win32#updir|SPVM::File::Spec::Instance::Win32/"updir"> method.

=head2 file_name_is_absolute

C<static method file_name_is_absolute : int ($path : string);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#file_name_is_absolute|SPVM::File::Spec::Instance::Unix/"file_name_is_absolute"> method.

For case Windows, see L<File::Spec::Instance::Win32#file_name_is_absolute|SPVM::File::Spec::Instance::Win32/"file_name_is_absolute"> method.

=head2 file_name_is_root

C<static method file_name_is_root : int ($path : string);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#file_name_is_root|SPVM::File::Spec::Instance::Unix/"file_name_is_root"> method.

For case Windows, see L<File::Spec::Instance::Win32#file_name_is_root|SPVM::File::Spec::Instance::Win32/"file_name_is_root"> method.

=head2 path

C<static method path : string[] ();>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#path|SPVM::File::Spec::Instance::Unix/"path"> method.

For case Windows, see L<File::Spec::Instance::Win32#path|SPVM::File::Spec::Instance::Win32/"path"> method.

=head2 join

C<static method join : string ($parts : string[]);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#join|SPVM::File::Spec::Instance::Unix/"join"> method.

For case Windows, see L<File::Spec::Instance::Win32#join|SPVM::File::Spec::Instance::Win32/"join"> method.

=head2 splitpath

C<static method splitpath : string[] ($path : string, $no_file : int = 0);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#splitpath|SPVM::File::Spec::Instance::Unix/"splitpath"> method.

For case Windows, see L<File::Spec::Instance::Win32#splitpath|SPVM::File::Spec::Instance::Win32/"splitpath"> method.

=head2 splitdir

C<static method splitdir : string[] ($path : string);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#splitdir|SPVM::File::Spec::Instance::Unix/"splitdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#splitdir|SPVM::File::Spec::Instance::Win32/"splitdir"> method.

=head2 catpath

C<static method catpath : string ($volume : string, $dir : string, $file : string);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#catpath|SPVM::File::Spec::Instance::Unix/"catpath"> method.

For case Windows, see L<File::Spec::Instance::Win32#catpath|SPVM::File::Spec::Instance::Win32/"catpath"> method.

=head2 abs2rel

C<static method abs2rel : string ($path : string, $base : string = undef);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#abs2rel|SPVM::File::Spec::Instance::Unix/"abs2rel"> method.

For case Windows, see L<File::Spec::Instance::Win32#abs2rel|SPVM::File::Spec::Instance::Win32/"abs2rel"> method.

=head2 rel2abs

C<static method rel2abs : string ($path : string, $base : string = undef);>

For case Unix-like OSs, see L<File::Spec::Instance::Unix#rel2abs|SPVM::File::Spec::Instance::Unix/"rel2abs"> method.

For case Windows, see L<File::Spec::Instance::Win32#rel2abs|SPVM::File::Spec::Instance::Win32/"rel2abs"> method.

=head1 Well Known Child Classes

=over 2

=item * L<File::Spec::Instance::Unix|SPVM::File::Spec::Instance::Unix>

=item * L<File::Spec::Instance::Win32|SPVM::File::Spec::Instance::Win32>

=back

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

