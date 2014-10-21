package Chado::Schema::Library::Libraryprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("libraryprop");
__PACKAGE__->add_columns(
  "libraryprop_id",
  {
    data_type => "integer",
    default_value => "nextval('libraryprop_libraryprop_id_seq'::regclass)",
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
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("libraryprop_id");
__PACKAGE__->add_unique_constraint("libraryprop_c1", ["library_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "library",
  "Chado::Schema::Library::Library",
  { library_id => "library_id" },
);
__PACKAGE__->has_many(
  "libraryprop_pubs",
  "Chado::Schema::Library::LibrarypropPub",
  { "foreign.libraryprop_id" => "self.libraryprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+3zCgPEZHvZ0DjQG80vJjA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
