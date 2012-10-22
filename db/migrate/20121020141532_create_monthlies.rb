class CreateMonthlies < ActiveRecord::Migration
  def change
    create_table :monthlies do |t|
      t.integer :year
      t.integer :month
      t.string :status

      t.timestamps
    end

    add_index :monthlies, [:year, :month], :unique => true
  end
end
