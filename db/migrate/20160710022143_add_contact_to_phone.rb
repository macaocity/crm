class AddContactToPhone < ActiveRecord::Migration
  def change
    add_reference :phones, :contact, index: true, foreign_key: true
  end
end
