class CreatePersonalReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_references do |t|
      t.string :first_name
      t.string :second_name
      t.string :first_last_name
      t.string :second_last_name
      t.string :cell_phone_number
      t.references :requisition, foreign_key: true

      t.timestamps
    end
  end
end
