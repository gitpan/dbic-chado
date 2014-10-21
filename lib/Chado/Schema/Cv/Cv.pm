package Chado::Schema::Cv::Cv;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cv");
__PACKAGE__->add_columns(
  "cv_id",
  {
    data_type => "integer",
    default_value => "nextval('cv_cv_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "definition",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("cv_id");
__PACKAGE__->add_unique_constraint("cv_c1", ["name"]);
__PACKAGE__->has_many(
  "cvterms",
  "Chado::Schema::Cv::Cvterm",
  { "foreign.cv_id" => "self.cv_id" },
);
__PACKAGE__->has_many(
  "cvtermpaths",
  "Chado::Schema::Cv::Cvtermpath",
  { "foreign.cv_id" => "self.cv_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:z1/2h43lz8AcVVb1KQ168w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
