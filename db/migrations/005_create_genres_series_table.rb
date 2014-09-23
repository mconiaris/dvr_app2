Sequel.migration do
  up do
    create_table(:genres_series) do
      primary_key :id
      foreign_key :series_id, :series
      foreign_key :genres_id, :genres
    end
  end

  # the undo
  down do
    drop_table(:genres_viewers) do
    end
  end
end

