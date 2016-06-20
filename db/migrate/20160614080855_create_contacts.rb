class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :chinese_first_name
      t.string :chinese_last_name
      t.string :nick_name
      t.string :occupation
      t.string :title

      t.timestamps null: false
    end
  end
end
