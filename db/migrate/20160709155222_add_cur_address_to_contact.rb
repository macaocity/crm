class AddCurAddressToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :current_address, :string
  end
end
