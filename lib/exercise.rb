require "./lib/connection"
require "./lib/customer"
require "./lib/item"
require "./lib/orderitem"
require "./lib/order"




average=(Order.sum(:amount).to_f)/(Order.count)
p average.round(2)

min = Order.pluck(:amount).min
p min.to_f

max = Order.pluck(:amount).max
p max.to_f

orders = Order.all.group(:customer_id).minimum(:amount)
orders.each do |word|
  p word.last.to_f
end

orders = Order.all.group(:customer_id).maximum(:amount)
orders.each do |word|
  p word.last.to_f
end

p Customer.where(state: 'Colorado')
p Customer.where(city: 'Rigobertoside')

arr = []
    arr << Customer.where(state: 'Virginia')
    puts arr.inspect
    arr << Customer.where(state: 'Ohio')
    puts arr.inspect
    puts arr.first.length
    puts arr.last.length


user = Item.find_by(description: 'snow board')
user.name = 'board01'
user.save
p user

Item.create(name: 'kayak01',description: 'one person river kayak')

Item.destroy(Item.where(name: 'kayak01').where(description: 'one person river kayak'))

sum = Order.all.group(:customer_id).sum(:amount)
sum.each do |amount|
  puts amount.last
end

arr = Order.joins('inner join customers.name ON orders.customer_id = customers.id ')
p arr
















