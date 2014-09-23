Sequel.migration do
  up do
    create_table(:flags) do
     primary_key :id
     String :name, :size=>127
    end
  end

  # the undo
  down do
    drop_table(:flags) do
    end
  end
end

