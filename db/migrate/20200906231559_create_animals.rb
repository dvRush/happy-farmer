class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :breeds do |t|
      t.string :name, null: false
      t.string :animal_type

      t.timestamps
    end

    create_table :animals do |t|
      t.string :tag
      t.string :genre, limit: 1
      t.date :birth_date
      t.references :breed
      t.references :father, foreign_key: { to_table: :animals }
      t.references :mother, foreign_key: { to_table: :animals }
      t.string :type, null: false

      t.timestamps
    end
  end
end
