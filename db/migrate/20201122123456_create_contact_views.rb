class CreateContactViews < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_views do |t|
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
