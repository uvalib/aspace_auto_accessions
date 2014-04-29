Accession.class_eval do

  id_2_generator = lambda {|json|
    sequence = "yale_accession_#{json['id_0']}_#{json['id_1']}"
    Sequence.get(sequence).to_s
  }

  auto_generate :property => :id_2,
							  :generator => id_2_generator,
  						  :only_on_create => true

end
