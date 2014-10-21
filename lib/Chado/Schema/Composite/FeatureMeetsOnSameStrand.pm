package Chado::Schema::Composite::FeatureMeetsOnSameStrand;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_meets_on_same_strand");
__PACKAGE__->add_columns(
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:c3R9b7qEQsr5U0Nt2W0LLw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
