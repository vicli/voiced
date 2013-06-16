class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :name
      t.string :description
      t.datetime :playtime
      t.string :image
      t.string :number
      t.integer :caller_id
      t.integer :callee_id
      t.integer :_type
      t.boolean :triggered, :default => false
      t.string :file
      t.string :message
      t.string :gender

      t.timestamps
    end
  end
end
