class ArchivesSpaceService < Sinatra::Base

  Endpoint.post('/repositories/:repo_id/departments')
	  .description("Create a department")
  	.params(["department", JSONModel(:department), "The record to create", :body => true],
            ["repo_id", :repo_id])
  	.permissions([:manage_repository])
  	.returns([200, :created]) \
  do 
    handle_create(Department, params[:department])
  end


  Endpoint.get('/repositories/:repo_id/departments')
  	.description("Get a list of departments")
  	.params(["repo_id", :repo_id])
  	.paginated(false)
		.permissions([])
  	.returns([200, "[(:department)]"]) \
  do 
    handle_unlimited_listing(Department, params)
  end
end
             
