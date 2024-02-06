class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :animal_photo
      t.date :date_of_birth
      t.decimal :weight
      t.integer :escape_attempts
      t.references :owner, null: false, foreign_key: {to_table: :users}
      t.references :genre, null: false, foreign_key: {to_table: :genres}

      t.timestamps
    end
  end
end
