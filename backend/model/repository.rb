Repository.class_eval do
  alias_method :core_after_create, :after_create

  def after_create
    core_after_create

    RequestContext.open(:repo_id => self.id) do
      DepartmentList.create_from_json(JSONModel(:department_list).from_hash(:codes => []), :repo_id => self.id)
    end
  end
end
