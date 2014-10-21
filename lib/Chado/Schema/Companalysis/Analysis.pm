package Chado::Schema::Companalysis::Analysis;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("analysis");
__PACKAGE__->add_columns(
  "analysis_id",
  {
    data_type => "integer",
    default_value => "nextval('analysis_analysis_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "program",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "programversion",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "algorithm",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "sourcename",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "sourceversion",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "sourceuri",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "timeexecuted",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("analysis_id");
__PACKAGE__->add_unique_constraint("analysis_c1", ["program", "programversion", "sourcename"]);
__PACKAGE__->has_many(
  "analysisfeatures",
  "Chado::Schema::Companalysis::Analysisfeature",
  { "foreign.analysis_id" => "self.analysis_id" },
);
__PACKAGE__->has_many(
  "analysisprops",
  "Chado::Schema::Companalysis::Analysisprop",
  { "foreign.analysis_id" => "self.analysis_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WpVZEs0LBIhsrk6ciQsE8w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
