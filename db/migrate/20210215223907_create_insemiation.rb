class CreateInsemiation < ActiveRecord::Migration[6.0]
  def change
    create_table :inseminations do |t|
      t.datetime :inseminated_at, null: false
      t.references :animal, null: false

      t.timestamps
    end
  end
end
