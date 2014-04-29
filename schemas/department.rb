{
  :schema => {
    "$schema" => "http://www.archivesspace.org/archivesspace.json",
    "version" => 1,
    "type" => "object",
    "uri" => "/repositories/:repo_id/departments",
    "properties" => {
      "code" => {"type" => "string", "maxLength" => 255, "required" => true}
    }
  }
}
