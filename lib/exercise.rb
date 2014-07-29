require "./lib/connection"
require "./lib/customer"
require "./lib/item"
require "./lib/orderitem"
require "./lib/order"

p Customer.all
p Customer.first
p Customer.last
p Customer.find(3)
p Customer.where(state: "Colorado")
p Customer.first(5)
p Customer.order(:name)
p Customer.order(:name => :desc)
p Item.all
p Item.where("name LIKE ?", "boot%")
p Order.all
p Order.first(5)
p Order.last(5)
p Customer.select(:name, :email)
p Customer.select(:id, :name, :address)
p Customer.count
p Order.sum(:amount).to_f
p Order.where(:customer_id => 1).sum(:amount).to_f
p Order.average(:amount).to_f
p Order.average(:amount).to_f.round(2)
p Order.minimum(:amount).to_f
p Order.maximum(:amount).to_f
p Order.select("customer_id").group("customer_id").minimum(:amount)
p Order.select("customer_id").group("customer_id").maximum(:amount)
p Customer.where(state: "Colorado")
p Customer.where(state: "Colorado", city: "Rigobertoside")
p Customer.where("state = ? or state = ?", "Ohio", "Virginia")
p Item.find_by(:description => "snow board").update(:description => "board01")
p Item.create(:name => "kayak01", :description => "one person river kayak")
p Item.find_by(:name => "kayak01").destroy
p Order.select("customer_id").group("customer_id").sum(:amount)
Order.joins(:customer).select(:id, :name, :amount)
p Customer.joins(:orders).select(:id, :name, "sum(amount) as total").group("customers.id").order(:name)
p Customer.joins(:orders).select(:id, :name, "avg(amount) as average").group("customers.id").order(:name)
p Customer.joins(:orders).select(:id, :name, "round(avg(amount),2) as average").group("customers.id").order(:name)
p Item.joins(:orders).select(:name).where("orders.customer_id = ?", 2)
p Customer.joins(orders: :items).select(:id).where("items.name = ?", "boot02")
p Customer.joins(orders: :items).select("customers.name").where("items.name = ?", "bike03").to_sql
p Customer.joins(orders: :items).select("customers.name, sum(orders.amount) as total").where("items.name = ? and customers.name = ?", "bike03", "Evert Pfeffer").group("customers.id").first.total.to_f












