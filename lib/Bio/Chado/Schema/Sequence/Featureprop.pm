package Bio::Chado::Schema::Sequence::Featureprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featureprop");
__PACKAGE__->add_columns(
  "featureprop_id",
  {
    data_type => "integer",
    default_value => "nextval('featureprop_featureprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
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
__PACKAGE__->set_primary_key("featureprop_id");
__PACKAGE__->add_unique_constraint("featureprop_c1", ["feature_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
);
__PACKAGE__->has_many(
  "featureprop_pubs",
  "Bio::Chado::Schema::Sequence::FeaturepropPub",
  { "foreign.featureprop_id" => "self.featureprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-16 09:31:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s7i2LaKfplHl6FFnhqu5Mg

__PACKAGE__->belongs_to
    (
     'cvterm',
     'Chado::Schema::Cv::Cvterm',
     { 'foreign.cvterm_id' => 'self.type_id' },
    );



# You can replace this text with custom content, and it will be preserved on regeneration
1;
