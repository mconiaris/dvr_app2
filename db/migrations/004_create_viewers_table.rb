Sequel.migration do
  up do
    create_table(:series_viewers) do
      primary_key :id
      foreign_key :viewer_id, :viewers
      foreign_key :series_id, :series
    end
  end

  # the undo
  down do
    drop_table(:series_viewers)
  end
end
