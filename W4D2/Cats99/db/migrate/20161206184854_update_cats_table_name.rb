class UpdateCatsTableName < ActiveRecord::Migration
  def change
    rename_table :cats_tables, :cats
  end
end
