class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :link
      t.string :short_link
      t.integer :clicks, :default => 0
      t.timestamps
    end

    add_index :urls, :link
    add_index :urls, :short_link
  end
end
