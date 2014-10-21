package Chado::Schema::Mage::Biomaterialprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("biomaterialprop");
__PACKAGE__->add_columns(
  "biomaterialprop_id",
  {
    data_type => "integer",
    default_value => "nextval('biomaterialprop_biomaterialprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "biomaterial_id",
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
__PACKAGE__->set_primary_key("biomaterialprop_id");
__PACKAGE__->add_unique_constraint("biomaterialprop_c1", ["biomaterial_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "biomaterial",
  "Chado::Schema::Mage::Biomaterial",
  { biomaterial_id => "biomaterial_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aOX0M0w0tcXf0dQ9jonSVA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
