class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :agenda_subitems do |t|
      t.string   :position
      t.string   :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :agenda_items do |t|
      t.integer  :position
      t.string   :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :agendas do |t|
      t.string   :name
      t.date     :meeting_date
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :agenda_subitems
    drop_table :agenda_items
    drop_table :agendas
  end
end
