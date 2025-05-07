package SPVM::File::Spec;

our $VERSION = "0.086";

1;

=head1 Name

SPVM::File::Spec - Portably Perform Operations on File Names

=head1 Description

File::Spec class in L<SPVM> has methods to portably perform operations on file names.

=head1 Details

This class has a singleton object of L<File::Spec::Instance|SPVM::File::Spec::Instance>.

Every methods in this class calls the method of the singleton object.

=head1 Usage

  use File::Spec;
  
  my $file = File::Spec->catfile(["foo", "bar", "a.txt"]);

=head1 Class Methods

=head2 canonpath

C<static method canonpath : string ($path : string);>

Calls L<File::Spec::Instance#canonpath|SPVM::File::Spec::Instance/"canonpath"> method given the singleton object and the arguments, and returns its return value.

=head2 catdir

C<static method catdir : string ($parts : string[]);>

Calls L<File::Spec::Instance#catdir|SPVM::File::Spec::Instance/"catdir"> method given the singleton object and the arguments, and returns its return value.

=head2 catfile

C<static method catfile : string ($parts : string[]);>

Calls L<File::Spec::Instance#catfile|SPVM::File::Spec::Instance/"catfile"> method given the singleton object and the arguments, and returns its return value.

=head2 curdir

C<static method curdir : string ();>

Calls L<File::Spec::Instance#curdir|SPVM::File::Spec::Instance/"curdir"> method given the singleton object, and returns its return value.

=head2 devnull

C<static method devnull : string ();>

Calls L<File::Spec::Instance#devnull|SPVM::File::Spec::Instance/"devnull"> method given the singleton object, and returns its return value.

=head2 rootdir

C<static method rootdir : string ();>

Calls L<File::Spec::Instance#rootdir|SPVM::File::Spec::Instance/"rootdir"> method given the singleton object, and returns its return value.

=head2 tmpdir

C<static method tmpdir : string ();>

Calls L<File::Spec::Instance#tmpdir|SPVM::File::Spec::Instance/"tmpdir"> method given the singleton object, and returns its return value.

=head2 updir

C<static method updir : string ();>

Calls L<File::Spec::Instance#updir|SPVM::File::Spec::Instance/"updir"> method given the singleton object, and returns its return value.

=head2 no_upwards

C<static method no_upwards : string[] ($parts : string[]);>

Calls L<File::Spec::Instance#no_upwards|SPVM::File::Spec::Instance/"no_upwards"> method given the singleton object and the arguments, and returns its return value.

=head2 file_name_is_absolute

C<static method file_name_is_absolute : int ($path : string);>

Calls L<File::Spec::Instance#file_name_is_absolute|SPVM::File::Spec::Instance/"file_name_is_absolute"> method given the singleton object and the arguments, and returns its return value.

=head2 path

C<static method path : string[] ();>

Calls L<File::Spec::Instance#path|SPVM::File::Spec::Instance/"path"> method given the singleton object, and returns its return value.

=head2 join

C<static method join : string ($parts : string[]);>

Calls L<File::Spec::Instance#join|SPVM::File::Spec::Instance/"join"> method given the singleton object and the arguments, and returns its return value.

=head2 splitpath

C<static method splitpath : string[] ($path : string, $no_file : int = 0);>>

Calls L<File::Spec::Instance#splitpath|SPVM::File::Spec::Instance/"splitpath"> method given the singleton object and the arguments, and returns its return value.

=head2 splitdir

C<static method splitdir : string[] ($path : string);>

Calls L<File::Spec::Instance#splitdir|SPVM::File::Spec::Instance/"splitdir"> method given the singleton object and the arguments, and returns its return value.

=head2 catpath

C<static method catpath : string ($volume : string, $dir : string, $file : string);>

Calls L<File::Spec::Instance#catpath|SPVM::File::Spec::Instance/"catpath"> method given the singleton object and the arguments, and returns its return value.

=head2 abs2rel

C<static method abs2rel : string ($path : string, $base : string = undef);>

Calls L<File::Spec::Instance#abs2rel|SPVM::File::Spec::Instance/"abs2rel"> method given the singleton object and the arguments, and returns its return value.

=head2 rel2abs

C<static method rel2abs : string ($path : string, $base : string = undef);>

Calls L<File::Spec::Instance#rel2abs|SPVM::File::Spec::Instance/"rel2abs"> method given the singleton object and the arguments, and returns its return value.

=head1 See Also

=over 2

=item * L<File::Spec::Instance|SPVM::File::Spec::Instance>

=item * L<File::Spec::Instance::Unix|SPVM::File::Spec::Instance::Unix>

=item * L<File::Spec::Instance::Win32|SPVM::File::Spec::Instance::Win32>

=item * L<Cwd|SPVM::Cwd>

=back

=head1 Porting

C<SPVM::File::Spec> is Perl's L<File::Spec> porting to L<SPVM>.

=head1 Repository

L<SPVM::File::Spec - Github|https://github.com/yuki-kimoto/SPVM-File-Spec>

=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

