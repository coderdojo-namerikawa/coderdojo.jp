class ModColumnsToUpcomingEvent < ActiveRecord::Migration[5.1]
  def up
    remove_index :upcoming_events, :event_at

    add_column :upcoming_events, :dojo_name, :string, null: false
    add_column :upcoming_events, :service_name, :string, null: false
    add_column :upcoming_events, :participants, :integer, null: false
  end

  def down
    remove_column :upcoming_events, :dojo_name, :string, null: false
    remove_column :upcoming_events, :service_name, :string, null: false
    remove_column :upcoming_events, :participants, :integer, null: false

    add_index :upcoming_events, :event_at, name: "index_upcoming_events_on_event_at"
  end
end
