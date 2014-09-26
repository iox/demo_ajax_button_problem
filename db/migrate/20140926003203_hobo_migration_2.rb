class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :agenda_subitems, :agenda_item_id, :integer

    add_column :agenda_items, :agenda_id, :integer

    add_column :agendas, :meeting_type, :string, :default => "Business"

    add_index :agenda_subitems, [:position]
    add_index :agenda_subitems, [:agenda_item_id]

    add_index :agenda_items, [:position]
    add_index :agenda_items, [:agenda_id]
  end

  def self.down
    remove_column :agenda_subitems, :agenda_item_id

    remove_column :agenda_items, :agenda_id

    remove_column :agendas, :meeting_type

    remove_index :agenda_subitems, :name => :index_agenda_subitems_on_position rescue ActiveRecord::StatementInvalid
    remove_index :agenda_subitems, :name => :index_agenda_subitems_on_agenda_item_id rescue ActiveRecord::StatementInvalid

    remove_index :agenda_items, :name => :index_agenda_items_on_position rescue ActiveRecord::StatementInvalid
    remove_index :agenda_items, :name => :index_agenda_items_on_agenda_id rescue ActiveRecord::StatementInvalid
  end
end
