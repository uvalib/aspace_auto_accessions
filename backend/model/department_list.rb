class DepartmentList < Sequel::Model(:department_list)
  include ASModel
  corresponds_to JSONModel(:department_list)

  set_model_scope :repository

  def self.sequel_to_jsonmodel(objs, opts = {})
    jsons = super

    jsons.zip(objs).each do |json, obj|
      json['codes'] = ASUtils.json_parse(obj.codes)
    end

    jsons
  end

  def self.create_from_json(json, opts = {})
    super(json, opts.merge('codes' => JSON(json.codes || [])))
  end


  def update_from_json(json, opts = {}, apply_nested_records = true)
    super(json, opts.merge('codes' => JSON(json.codes || [])))
  end


end
