package SPVM::File::Spec::Instance;

1;

=head1 Name

SPVM::File::Spec::Instance - Object-Oriented Version of File::Spec class

=head1 Description

File::Spec::Instance class in L<SPVM> is the object-oriented version of L<File::Spec|SPVM::File::Spec> class.

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

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#canonpath|SPVM::File::Spec::Instance::Unix/"canonpath"> method.

For case Windows, see L<File::Spec::Instance::Win32#canonpath|SPVM::File::Spec::Instance::Win32/"canonpath"> method.

Exceptions:

This method throws an exception.

=head2 catdir

C<static method catdir : string ($parts : string[]);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#catdir|SPVM::File::Spec::Instance::Unix/"catdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#catdir|SPVM::File::Spec::Instance::Win32/"catdir"> method.

Exceptions:

This method throws an exception.

=head2 catfile

C<static method catfile : string ($parts : string[]);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#catfile|SPVM::File::Spec::Instance::Unix/"catfile"> method.

For case Windows, see L<File::Spec::Instance::Win32#catfile|SPVM::File::Spec::Instance::Win32/"catfile"> method.

Exceptions:

This method throws an exception.

=head2 curdir

C<static method curdir : string ();>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#curdir|SPVM::File::Spec::Instance::Unix/"curdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#curdir|SPVM::File::Spec::Instance::Win32/"curdir"> method.

Exceptions:

This method throws an exception.

=head2 devnull

C<static method devnull : string ();>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#devnull|SPVM::File::Spec::Instance::Unix/"devnull"> method.

For case Windows, see L<File::Spec::Instance::Win32#devnull|SPVM::File::Spec::Instance::Win32/"devnull"> method.

Exceptions:

This method throws an exception.

=head2 rootdir

C<static method rootdir : string ();>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#rootdir|SPVM::File::Spec::Instance::Unix/"rootdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#rootdir|SPVM::File::Spec::Instance::Win32/"rootdir"> method.

Exceptions:

This method throws an exception.

=head2 tmpdir

C<static method tmpdir : string ();>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#tmpdir|SPVM::File::Spec::Instance::Unix/"tmpdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#tmpdir|SPVM::File::Spec::Instance::Win32/"tmpdir"> method.

Exceptions:

This method throws an exception.

=head2 updir

C<static method updir : string ();>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#updir|SPVM::File::Spec::Instance::Unix/"updir"> method.

For case Windows, see L<File::Spec::Instance::Win32#updir|SPVM::File::Spec::Instance::Win32/"updir"> method.

Exceptions:

This method throws an exception.

=head2 no_upwards

C<static method no_upwards : string[] ($parts : string[]);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#updir|SPVM::File::Spec::Instance::Unix/"updir"> method.

For case Windows, see L<File::Spec::Instance::Win32#updir|SPVM::File::Spec::Instance::Win32/"updir"> method.

Exceptions:

This method throws an exception.

=head2 file_name_is_absolute

C<static method file_name_is_absolute : int ($path : string);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#file_name_is_absolute|SPVM::File::Spec::Instance::Unix/"file_name_is_absolute"> method.

For case Windows, see L<File::Spec::Instance::Win32#file_name_is_absolute|SPVM::File::Spec::Instance::Win32/"file_name_is_absolute"> method.

Exceptions:

This method throws an exception.

=head2 file_name_is_root

C<static method file_name_is_root : int ($path : string);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#file_name_is_root|SPVM::File::Spec::Instance::Unix/"file_name_is_root"> method.

For case Windows, see L<File::Spec::Instance::Win32#file_name_is_root|SPVM::File::Spec::Instance::Win32/"file_name_is_root"> method.

Exceptions:

This method throws an exception.

=head2 path

C<static method path : string[] ();>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#path|SPVM::File::Spec::Instance::Unix/"path"> method.

For case Windows, see L<File::Spec::Instance::Win32#path|SPVM::File::Spec::Instance::Win32/"path"> method.

Exceptions:

This method throws an exception.

=head2 join

C<static method join : string ($parts : string[]);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#join|SPVM::File::Spec::Instance::Unix/"join"> method.

For case Windows, see L<File::Spec::Instance::Win32#join|SPVM::File::Spec::Instance::Win32/"join"> method.

Exceptions:

This method throws an exception.

=head2 splitpath

C<static method splitpath : string[] ($path : string, $no_file : int = 0);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#splitpath|SPVM::File::Spec::Instance::Unix/"splitpath"> method.

For case Windows, see L<File::Spec::Instance::Win32#splitpath|SPVM::File::Spec::Instance::Win32/"splitpath"> method.

Exceptions:

This method throws an exception.

=head2 splitdir

C<static method splitdir : string[] ($path : string);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#splitdir|SPVM::File::Spec::Instance::Unix/"splitdir"> method.

For case Windows, see L<File::Spec::Instance::Win32#splitdir|SPVM::File::Spec::Instance::Win32/"splitdir"> method.

Exceptions:

This method throws an exception.

=head2 catpath

C<static method catpath : string ($volume : string, $dir : string, $file : string);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#catpath|SPVM::File::Spec::Instance::Unix/"catpath"> method.

For case Windows, see L<File::Spec::Instance::Win32#catpath|SPVM::File::Spec::Instance::Win32/"catpath"> method.

Exceptions:

This method throws an exception.

=head2 abs2rel

C<static method abs2rel : string ($path : string, $base : string = undef);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#abs2rel|SPVM::File::Spec::Instance::Unix/"abs2rel"> method.

For case Windows, see L<File::Spec::Instance::Win32#abs2rel|SPVM::File::Spec::Instance::Win32/"abs2rel"> method.

Exceptions:

This method throws an exception.

=head2 rel2abs

C<static method rel2abs : string ($path : string, $base : string = undef);>

This method is not implemented in this class.

For case Unix-like OSs, see L<File::Spec::Instance::Unix#rel2abs|SPVM::File::Spec::Instance::Unix/"rel2abs"> method.

For case Windows, see L<File::Spec::Instance::Win32#rel2abs|SPVM::File::Spec::Instance::Win32/"rel2abs"> method.

Exceptions:

This method throws an exception.

=head1 Well Known Child Classes

=over 2

=item * L<File::Spec::Instance::Unix|SPVM::File::Spec::Instance::Unix>

=item * L<File::Spec::Instance::Win32|SPVM::File::Spec::Instance::Win32>

=back

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

