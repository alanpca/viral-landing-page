class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.string :email
      t.integer :refer, :default => 0
      t.integer :clicks, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :invites
  end
end
