package Chado::Schema::Library::LibrarypropPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("libraryprop_pub");
__PACKAGE__->add_columns(
  "libraryprop_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('libraryprop_pub_libraryprop_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "libraryprop_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("libraryprop_pub_id");
__PACKAGE__->add_unique_constraint("libraryprop_pub_c1", ["libraryprop_id", "pub_id"]);
__PACKAGE__->belongs_to(
  "libraryprop",
  "Chado::Schema::Library::Libraryprop",
  { libraryprop_id => "libraryprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nnW2Tk6A9q1KI+7umeifBQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
