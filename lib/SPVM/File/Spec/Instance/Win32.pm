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

=head1 Instance Methods

=head2 devnull

C<method devnull : string ();>

=head2 rootdir

C<method rootdir : string ();>

=head2 tmpdir

C<method tmpdir : string ();>

=head2 file_name_is_absolute

C<method file_name_is_absolute : int ($path : string);>

=head2 file_name_is_root

C<method file_name_is_root : int ($path : string);>

=head2 path

C<method path : string[] ();>

=head2 splitpath

C<method splitpath : string[] ($path : string, $nofile : int = 0);>

=head2 splitdir

C<method splitdir : string[] ($path : string);>

=head2 canonpath

C<method canonpath : string ($path : string);>

=head2 catdir

C<method catdir : string ($dir_parts : string[]);>

=head2 catfile

C<method catfile : string ($parts : string[]);>

=head2 rel2abs

C<method rel2abs : string ($path : string, $base : string = undef);>

=head2 catpath

C<method catpath : string ($volume : string, $dir : string, $file : string);>

=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

