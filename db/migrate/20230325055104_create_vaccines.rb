class CreateVaccines < ActiveRecord::Migration[7.0]
  def change
    create_table :vaccines do |t|
      t.text :vaccine_type
      t.date :vaccine_date
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
