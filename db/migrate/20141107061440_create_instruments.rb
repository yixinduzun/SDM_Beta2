class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :offer_id
      t.text :details

      t.timestamps
    end
  end
end
