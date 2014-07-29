require "active_record"

class Orderitem < ActiveRecord::Base
belongs_to :order
belongs_to :item
end


