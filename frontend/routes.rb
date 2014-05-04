ArchivesSpace::Application.routes.draw do
  match 'plugins/yale_accessions/department_codes' => 'yale_accessions#department_list', :via => [:get]
  match 'plugins/yale_accessions/department_codes' => 'yale_accessions#department_list_update', :via => [:post]
end
