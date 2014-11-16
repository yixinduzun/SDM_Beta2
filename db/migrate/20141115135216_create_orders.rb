class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :instrument_name
      t.string :snum
      t.datetime :start
      t.datetime :finish
      t.decimal :cost

      t.timestamps
    end
  end
end
