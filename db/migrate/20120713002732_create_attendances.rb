class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.date :date
      t.time :in
      t.time :out
      t.string :note

      t.timestamps
    end
  end
end
