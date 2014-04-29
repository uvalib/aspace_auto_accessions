class Department < Sequel::Model(:department)
  include ASModel
  corresponds_to JSONModel(:department)

  set_model_scope :repository

end
