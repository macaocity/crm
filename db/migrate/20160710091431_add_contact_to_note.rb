class AddContactToNote < ActiveRecord::Migration
  def change
    add_reference :notes, :contact, index: true, foreign_key: true
  end
end
