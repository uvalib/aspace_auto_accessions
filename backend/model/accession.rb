Accession.class_eval do

  alias_method :core_update_from_json, :update_from_json

  def update_from_json(json, *other_args)
    json[:id_2] = nil

    # don't get a new sequence unless id_0 or id_1 has changed
    if self[:identifier]
      identifier = Identifiers.parse(self[:identifier])
      if [identifier[0], identifier[1]] == [json[:id_0], json[:id_1]]
        json[:id_2] = identifier[2]
      end
    end

    core_update_from_json(json, *other_args)
  end


  id_2_generator = lambda {|json|
    sequence_name = "yale_accession_#{json['id_0']}_#{json['id_1']}"

    seq = Sequence.get(sequence_name)
    seq = Sequence.get(sequence_name) if seq < 1

    seq.to_s.rjust(4, '0')
  }

  id_0_generator = lambda {|json|
    date = Date.parse(json['accession_date'])
    "#{date.month > 5 ? date.year : date.year - 1}"
  }

  # We can't use the built-in auto-generate helper because
  # these generators needs to be first in line
  properties_to_auto_generate.unshift ({
    :property => :id_0,
    :generator => id_0_generator,
    :only_if => proc { true }
  })

  # override of update_from_json will set id_2
  # from the db if nothing else has changed
  properties_to_auto_generate.unshift ({
    :property => :id_2,
    :generator => id_2_generator,
    :only_if => proc {|json| json[:id_2].nil? }
  })



end
