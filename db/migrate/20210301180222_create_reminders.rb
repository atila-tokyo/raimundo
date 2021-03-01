class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.date :alarm_time
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :medicine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
