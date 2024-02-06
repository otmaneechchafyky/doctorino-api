class CreateVets < ActiveRecord::Migration[7.0]
  def change
    create_table :vets do |t|
      t.string :name
      t.string :vet_photo
      t.time :available_from
      t.time :available_to
      t.decimal :fees
      t.text :bio
      t.references :specialization, null: false, foreign_key: {to_table: :specializations}

      t.timestamps
    end
  end
end
