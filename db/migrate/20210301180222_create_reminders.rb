class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.datetime :alarm_time
      t.string :medicine_dose
      t.string :title, null: false
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :medicine, foreign_key: true

      t.timestamps
    end
  end
end
