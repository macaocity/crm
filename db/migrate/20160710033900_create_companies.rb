class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :comp_name
      t.string :comp_tel
      t.string :comp_addr
      t.string :comp_country
      t.string :comp_city
      t.string :title

      t.timestamps null: false
    end
  end
end
