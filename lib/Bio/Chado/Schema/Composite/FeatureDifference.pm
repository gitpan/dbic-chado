package Bio::Chado::Schema::Composite::FeatureDifference;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_difference");
__PACKAGE__->add_columns(
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "srcfeature_id",
  {
    data_type => "smallint",
    default_value => undef,
    is_nullable => 1,
    size => 2,
  },
  "fmin",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "fmax",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "strand",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aG5vnNqXacrpxXzrDQNbtA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
