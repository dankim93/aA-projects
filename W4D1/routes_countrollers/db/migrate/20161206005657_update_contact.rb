class UpdateContact < ActiveRecord::Migration
  def change
    remove_column :contacts, :name
    remove_column :contacts, :email
    remove_column :contacts, :user_id

    add_column :contacts, :name, :string
    add_column :contacts, :email, :string
    add_column :contacts, :user_id, :integer
    add_index(:contacts, [:email, :user_id], unique: true)

  end
end
