package SPVM::File::Spec;

our $VERSION = '0.02';

1;

=head1 Name

SPVM::File::Spec - Portably Perform Operations on File Names

=head1 Description

C<SPVM::File::Spec> is the L<SPVM>'s C<File::Spec> class.

This module is designed to support operations commonly performed on file specifications

=head1 Usage

  use File::Spec;
  
  my $file = File::Spec->catfile(["foo", "bar"], "a.txt"]);

=head1 Class Methods

=head2 canonpath

  static method canonpath : string ($path : string);

=head2 catdir

  static method catdir : string ($directories : string[]);

=head2 catfile

  static method catfile : string ($directories : string[], $filename : string);

=head2 curdir

  static method curdir : string ();

=head2 devnull

  static method devnull : string ();

=head2 rootdir

  static method rootdir : string ();

=head2 tmpdir

  static method tmpdir : string ();

=head2 updir

  static method updir : string ();

=head2 no_upwards

  static method no_upwards : string[] ($directories : string[]);

=head2 file_name_is_absolute

  static method file_name_is_absolute : int ($path : string);

=head2 path

  static method path : string[] ();

=head2 join

  static method join : string ($directories : string[], $filename : string);

=head2 splitpath

  static method splitpath : string[] ($path : string, $no_file = 0 : int);

=head2 splitdir

  static method splitdir : string[] ($path : string);

=head2 catpath

  static method catpath : string ($volume : string, $directory : string, $file : string);

=head2 abs2rel

  static method abs2rel : string ($path : string, $base = undef : string);

=head2 rel2abs

  static method rel2abs : string ($path : string, $base = undef : string);

=head1 Object Oriented Classes

The following classes are used to implement C<SPVM::File::Spec>.

=over 2

=item * L<File::Spec::Instance|SPVM::File::Spec::Instance>

=item * L<File::Spec::Instance::Unix|SPVM::File::Spec::Instance::Unix>

=item * L<File::Spec::Instance::Win32|SPVM::File::Spec::Instance::Win32>

=back

=head1 SPVM::Cwd

L<SPVM::Cwd> is included in this distribution.

=over 2

=item * L<SPVM::Cwd>

=back

=head1 See Also

=head2 File::Spec

C<SPVM::File::Spec> is Perl's L<File::Spec> porting to L<SPVM>.

=head1 Repository

L<SPVM::File::Spec - Github|https://github.com/yuki-kimoto/SPVM-File-Spec>

=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright 2022-2022 Yuki Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

