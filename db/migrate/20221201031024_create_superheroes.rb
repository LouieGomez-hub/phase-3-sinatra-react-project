class CreateSuperheroes < ActiveRecord::Migration[6.1]
  def change
    create_table :superheroes do |t|
      t.string :name
      t.string :power
      t.integer :hero_id
      t.timestamps
    end
  end
end
