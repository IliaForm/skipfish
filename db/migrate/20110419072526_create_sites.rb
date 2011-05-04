class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.references :user
      t.string :url
      t.string :status
      t.string :token
      t.text :result
      t.string :slovar
      t.timestamps
    end
    add_index :sites,:user_id
  end

  def self.down
    remove_index :sites, :user_id
    drop_table :sites
  end
end
