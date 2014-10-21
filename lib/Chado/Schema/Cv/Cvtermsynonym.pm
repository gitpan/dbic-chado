package Chado::Schema::Cv::Cvtermsynonym;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cvtermsynonym");
__PACKAGE__->add_columns(
  "cvtermsynonym_id",
  {
    data_type => "integer",
    default_value => "nextval('cvtermsynonym_cvtermsynonym_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "cvterm_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "synonym",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 1024,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("cvtermsynonym_id");
__PACKAGE__->add_unique_constraint("cvtermsynonym_c1", ["cvterm_id", "synonym"]);
__PACKAGE__->belongs_to(
  "type",
  "Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "cvterm",
  "Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UWLR1W6ICEWk8EDs2JqHQw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
