ArchivesSpace::Application.routes.draw do

  match 'plugins/yale_accessions/department_codes' => 'yale_accessions#department_codes', :via => [:get]

end
