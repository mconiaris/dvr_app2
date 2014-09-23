Sequel.migration do

  # what we want to do
  up do
    create_table(:genres) do
      primary_key :id
      String :name, :size => 127, :null => false
    end
  end

  # the undo
  down do
    drop_table(:genres)
  end

  end
