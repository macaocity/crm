class RemoveTypeNameFromContact < ActiveRecord::Migration
  def change
    remove_column :contacts, :type, :string
  end
end
