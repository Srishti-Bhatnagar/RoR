class CreateFarmers < ActiveRecord::Migration
  def change
    create_table :farmers do |t|
      t.string :name
      t.integer :number_of_animals

      t.timestamps null: false
    end
  end
end
