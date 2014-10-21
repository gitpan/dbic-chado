package Chado::Schema::Mage::Studyprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studyprop");
__PACKAGE__->add_columns(
  "studyprop_id",
  {
    data_type => "integer",
    default_value => "nextval('studyprop_studyprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "study_id",
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
__PACKAGE__->set_primary_key("studyprop_id");
__PACKAGE__->add_unique_constraint("studyprop_study_id_key", ["study_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "study",
  "Chado::Schema::Mage::Study",
  { study_id => "study_id" },
);
__PACKAGE__->has_many(
  "studyprop_features",
  "Chado::Schema::Mage::StudypropFeature",
  { "foreign.studyprop_id" => "self.studyprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:S9mjwtC4s3Mk8g7bloT6eQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
