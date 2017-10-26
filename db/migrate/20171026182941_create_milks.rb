class CreateMilks < ActiveRecord::Migration
  def change
    create_table :milks do |t|
      t.references :farmer, index: true, foreign_key: true
      t.integer :quantity
      t.integer :quality
      t.string :status

      t.timestamps null: false
    end
  end
end
