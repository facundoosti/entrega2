require_relative "Product.rb"
class Purchase

	attr_accessor :products
	attr_accessor :total
	
	def initialize
		@products = []
		@total    = 0
	end
	
	def add a_product
			self.total += a_product.price.to_i 
			products.push a_product
			puts "done..."
	end

	def delete
		total -= products.last.price.to_i
		products.pop
		puts "done..."	
	end
	
	def apply_discount
		yield self		
	end
end

p1 = Product.new '01', 'Martillo', '50'
p2 = Product.new '02', 'Clavos x 100', '10'

p = Purchase.new
p.add p1
p.add p2

puts p.total
# => 60

p.apply_discount do |purchase|
  p hammers = purchase.products.collect { |product| product.code == '01' }
  purchase.total -= purchase.total * 0.1 if hammers.any?
end

puts p.total





