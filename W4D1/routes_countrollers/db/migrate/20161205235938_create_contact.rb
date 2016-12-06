class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index(:contacts, [:name, :email], unique: true)
  end
end
