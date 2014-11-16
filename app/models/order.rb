class Order < ActiveRecord::Base
  attr_accessible :cost, :finish, :instrument_name, :snum, :start
end
