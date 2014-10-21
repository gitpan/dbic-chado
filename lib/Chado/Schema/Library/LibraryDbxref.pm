package Chado::Schema::Library::LibraryDbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("library_dbxref");
__PACKAGE__->add_columns(
  "library_dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('library_dbxref_library_dbxref_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "library_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_current",
  {
    data_type => "boolean",
    default_value => "true",
    is_nullable => 0,
    size => 1,
  },
);
__PACKAGE__->set_primary_key("library_dbxref_id");
__PACKAGE__->add_unique_constraint("library_dbxref_c1", ["library_id", "dbxref_id"]);
__PACKAGE__->belongs_to(
  "library",
  "Chado::Schema::Library::Library",
  { library_id => "library_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aIaFqfWa33oTMy13ksPU2Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
