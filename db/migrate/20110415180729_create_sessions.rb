﻿class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.string :session_id
      t.text :data

      t.timestamps
    end
    add_index :sessions, :session_id
    add_index :sessions, :updated_at
  end

  def self.down
  	
    remove_index :sessions, :session_id
    remove_index :sessions, :updated_at
    drop_table :sessions
  end
end
