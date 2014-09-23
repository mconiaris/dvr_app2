Sequel.migration do
  up do
    create_table(:flags_episodes) do
      Fixnum :episode_id
      Fixnum :series_id
    end
  end

  # the undo
  down do
    drop_table(:flags_episodes) do
    end
  end
end
