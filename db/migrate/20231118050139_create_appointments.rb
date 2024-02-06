class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.string :location
      t.decimal :duration
      t.references :animal, null: false, foreign_key: {to_table: :animals}
      t.references :vet, null: false, foreign_key: {to_table: :vets}

      t.timestamps
    end
  end
end
