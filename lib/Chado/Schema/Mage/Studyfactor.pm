package Chado::Schema::Mage::Studyfactor;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studyfactor");
__PACKAGE__->add_columns(
  "studyfactor_id",
  {
    data_type => "integer",
    default_value => "nextval('studyfactor_studyfactor_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "studydesign_id",
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
__PACKAGE__->set_primary_key("studyfactor_id");
__PACKAGE__->belongs_to(
  "studydesign",
  "Chado::Schema::Mage::Studydesign",
  { studydesign_id => "studydesign_id" },
);
__PACKAGE__->has_many(
  "studyfactorvalues",
  "Chado::Schema::Mage::Studyfactorvalue",
  { "foreign.studyfactor_id" => "self.studyfactor_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-06-23 22:52:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:l3ozvab+pyLGzZdnnBajnQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
