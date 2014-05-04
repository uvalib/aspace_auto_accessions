{
  :schema => {
    "$schema" => "http://www.archivesspace.org/archivesspace.json",
     "version" => 1,
    "type" => "object",
    "uri" => "/repositories/:repo_id/department_lists",
    "properties" => {
      "uri" => {"type" => "string", "required" => false},
      "codes" => {
        "type" => "array",
        "items" => {
          "type" => "string"
        }
      },
      "default_value" => {"type" => "string"}
    }
  }
}
