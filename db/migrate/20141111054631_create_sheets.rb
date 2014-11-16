class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :snum
      t.string :name
      t.datetime :start
      t.datetime :finsish
      t.decimal :cost

      t.timestamps
    end
  end
end
