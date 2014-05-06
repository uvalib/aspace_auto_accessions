require_relative 'mixins/accession_id_generator.rb'

Accession.class_eval do
  include YaleAccessionIdGenerator
end


  # We can't use the built-in auto-generate helper because
  # these generators needs to be first in line
Accession.properties_to_auto_generate.unshift ({
  :property => :id_0,
  :generator => YaleAccessionIdGenerator.id_0_generator,
  :only_if => proc { true }
})

  # override of update_from_json will set id_2
  # from the db if nothing else has changed
Accession.properties_to_auto_generate.unshift ({
  :property => :id_2,
  :generator => YaleAccessionIdGenerator.id_2_generator,
  :only_if => proc {|json| json[:id_2].nil? }
})

