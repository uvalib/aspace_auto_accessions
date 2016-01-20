require 'time'

class ArchivesSpaceService < Sinatra::Base

  Endpoint.post('/plugins/generate_accession_identifiers/next')
    .description("Generate a new identifier based on the year and a running number")
    .params()
    .permissions([])
    .returns([200, "{'year', 'YYYY', 'number', N}"]) \
  do
    year = Time.now.strftime('%Y')
    number = Sequence.get("GENERATE_ACCESSION_IDENTIFIER_#{year}")

    json_response(:year => year, :number => number)
  end


  Endpoint.post( '/plugins/repositories/:repo_id/generate_accession_identifiers/next' )
  .description("Generate a new identifier based on the :repo_id, year and a running number")
  .params(["repo_id", :repo_id])
  .permissions([])
  .returns([200, "{'repo_id' :repo_id, 'year', 'YYYY', 'number', N}"]) \
do
  repo = Repository.find( :id => params[:repo_id].to_i ).values
  org_code = repo[:org_code] || repo[:repo_code]
  year = Time.now.strftime('%Y')
  number = Sequence.get("GENERATE_ACCESSION_IDENTIFIER_#{org_code}_#{year}")
  json_response(:org_code => org_code, :year => year, :number => number)
end
  

end
