package Chado::Schema::Mage::Study;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("study");
__PACKAGE__->add_columns(
  "study_id",
  {
    data_type => "integer",
    default_value => "nextval('study_study_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "contact_id",
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
    is_nullable => 1,
    size => 4,
  },
  "dbxref_id",
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
    is_nullable => 0,
    size => undef,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("study_id");
__PACKAGE__->add_unique_constraint("study_c1", ["name"]);
__PACKAGE__->has_many(
  "study_assays",
  "Chado::Schema::Mage::StudyAssay",
  { "foreign.study_id" => "self.study_id" },
);
__PACKAGE__->has_many(
  "studydesigns",
  "Chado::Schema::Mage::Studydesign",
  { "foreign.study_id" => "self.study_id" },
);
__PACKAGE__->has_many(
  "studyprops",
  "Chado::Schema::Mage::Studyprop",
  { "foreign.study_id" => "self.study_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LpT1v6kUm95arhVPqVgwbA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
