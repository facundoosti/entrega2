require_relative "Product.rb"
class Purchase

	attr_accessor :products
	attr_accessor :suma_total
	
	def initialize
		@products = []
	end
	
	def add a_product
			products.push a_product
			puts "done..."
	end

	def delete
		products.pop
		puts "done..."	
	end

	def total
		suma_total = products.collect { |product| product.price.to_i }.inject { |sum, elem| sum+elem  }.to_i	 
		puts suma_total
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

p.total
# => 60

p.apply_discount do |purchase|
  p hammers = purchase.products.collect { |product| product.code == '01' }
  purchase.suma_total -= purchase.suma_total * 0.1 if hammers.any?
end

p.total



