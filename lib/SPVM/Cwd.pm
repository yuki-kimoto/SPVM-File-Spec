package SPVM::Cwd;

1;

=head1 Name

SPVM::Cwd - Getting Pathname of Current Working Directory

=head1 Description

Cwd class in L<SPVM> has methods to get the pathname of the current working directory.

=head1 Usage

  use Cwd;
  
  my $dir = Cwd->getcwd;
  
  my $abs_path = Cwd->abs_path($file);

=head1 Class Methods

=head2 getcwd

C<static method getcwd : string ();>

Calls the L<getcwd|SPVM::Sys::IO/"getcwd"> method in the L<Sys::IO|SPVM::Sys::IO> class and returns the return value.

On Windows, the path separaters C<\> of the return value are replaced with C</>.

=head2 abs_path

C<static method abs_path : string ($file :string);>

The alias for the L</"realpath"> method.

=head2 realpath

C<static method realpath : string ($file : string);>

Calls L<realpath|https://linux.die.net/man/3/realpath> system cal given the file $file, and returns its return value.

In Windows, L<realpath|https://linux.die.net/man/3/realpath> system call is emulated by L<GetFullPathNameW|https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-getfullpathnamew> function.

The path separaters C<\> of the return value are replaced with C</> on Windows.

=head2 getdcwd

C<static method getdcwd : string ($drive : string = undef);>

The C<$drive> is a drive letter such as C<C:>, C<D:>. It is converted to the drive id.

And calls the L<_getdcwd|SPVM::Sys::IO/"_getdcwd"> method in the L<Sys::IO|SPVM::Sys::IO> returns the return value.

On Windows, the path separaters C<\> of the return value are replaced with C</>

Exceptions:

The getdcwd is not supported on this system(_WIN32).

The length of the $drive must be 2.

The first character of the $drive must be [a-zA-Z].

The second character of the $drive must be ":".

=head1 See Also

=over 2

=item * L<SPVM::File::Spec>

=item * L<SPVM::Sys>

=back

=head2 Porting

C<SPVM::Cwd> is a Perl's L<Cwd> porting to L<SPVM>.

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

