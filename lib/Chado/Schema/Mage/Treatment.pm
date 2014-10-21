package Chado::Schema::Mage::Treatment;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("treatment");
__PACKAGE__->add_columns(
  "treatment_id",
  {
    data_type => "integer",
    default_value => "nextval('treatment_treatment_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
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
  "protocol_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("treatment_id");
__PACKAGE__->has_many(
  "biomaterial_treatments",
  "Chado::Schema::Mage::BiomaterialTreatment",
  { "foreign.treatment_id" => "self.treatment_id" },
);
__PACKAGE__->belongs_to(
  "protocol",
  "Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "biomaterial",
  "Chado::Schema::Mage::Biomaterial",
  { biomaterial_id => "biomaterial_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Yz+uE3t5sjH5iMF+FPonRQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
