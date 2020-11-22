class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :mobile_number
      t.string :landline_number
      t.text :notes
      t.string :image

      t.timestamps
    end
  end
end
