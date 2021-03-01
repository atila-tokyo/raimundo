class CreateMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :medicines do |t|
      t.float :dose
      t.string :name

      t.timestamps
    end
  end
end
