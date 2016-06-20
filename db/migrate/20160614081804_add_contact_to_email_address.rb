class AddContactToEmailAddress < ActiveRecord::Migration
  def change
    add_reference :email_addresses, :contact, index: true, foreign_key: true
  end
end
