
Sequel.migration do

  up do
    create_table(:department) do
      primary_key :id

      String :code, :unique => true, :null => false
      Integer :repo_id, :null => false

      apply_mtime_columns
    end

    alter_table(:department) do
      add_foreign_key([:repo_id], :repository, :key => :id)
    end
  end


  down do
  end

end

