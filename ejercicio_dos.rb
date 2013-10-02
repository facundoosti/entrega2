class Product
	
	attr_accessor :code
	attr_accessor :name
	attr_accessor :prize

	def initialize code, name, prize
		@code 	= code
		@name 	= name
		@prize 	= prize
	end
	
end

class Purchase

	attr_accessor :products
	attr_accessor :total
	
	def initialize
		@products = []
		@total    = 0
	end
	
	def restart_total
		self.total = products.collect {|e| e.prize.to_i}.inject :+
	end
	def add a_product
			self.total += a_product.prize.to_i 
			products.push a_product
			puts "add done..."
	end

	def delete a_product
		if (products.delete a_product).nil?
			puts "not found product"
		else
			self.total -= a_product.prize.to_i
			puts "delete done..."	
		end
	end
	
	def apply_discount
		yield self		
	end
end

# Casos de Prueba: Ejercicio2

def casos_de_prueba_ejercicio_dos
	p1  = Product.new '01', 'Martillo', '50'
	p2  = Product.new '02', 'Clavos x 100', '10'
	p3  = Product.new '02', 'Clavos x 100', '10'
	p4  = Product.new '04', 'Mecha de taladro', '65'
	p5  = Product.new '04', 'Mecha de taladro', '65'
	p6  = Product.new '04', 'Mecha de taladro', '65'
	p7  = Product.new '07', 'Destornillador', '10'
	p8  = Product.new '08', 'Arandela x 20', '2'
	p9  = Product.new '09', 'Tornillo Pasante x 10', '10'
	p10 = Product.new '10', 'Escofina', '45'
	p11 = Product.new '11', 'Maquina de cortar pasto', '365'
	p12 = Product.new '12', 'Bordeadora', '290'
	
	p = Purchase.new
	puts "Agregando Productos a la orden de Compra.."
	p.add p6
	p.add p1
	p.add p2
	p.add p3
	p.add p4
	p.add p7
	p.add p8
	p.add p9
	p.add p10
	p.add p5
	p.add p11
	p.add p12

	puts "Total: #{p.total}"
	# => 987

	p.delete p10

	puts "Total: #{p.total}"
	# => 942
	
	puts "Descuento de 10% en tu compra si llevás algún martillo:"
	# Descuento de 10% en tu compra si llevás algún martillo!
	p.apply_discount do |purchase|
	  hammers = purchase.products.collect { |product| product.code == '01' }
	  purchase.total -= purchase.total * 0.1 if hammers.any?
	end

	puts "Total: #{p.total}"
	# => 847.8
	
	p.restart_total
	
	puts "Aplico borrado del descuento anterior...:"
	
	puts "Total: #{p.total}"
	# =>942


	puts "Descuento de 20% en la compra si llevás mas de 10 productos:"
	# Descuento de 20% en la compra si llevás mas de 10 productos
	p.apply_discount do |purchase|
	  purchase.total *= 0.8 if purchase.products.size > 10
	end

	puts "Total: #{p.total}"
		# => 753.6

	puts "Descuento si tiene más de 3 productos iguales, cada 3 paga 2:"
	# Descuento si tiene más de 3 productos iguales, cada 3 paga 2
	p.apply_discount do |purchase|
		productos = purchase.products.group_by{|product| product.code}.select {|k,v| v.size >= 3  }
		productos.each {|k, v| purchase.total -= v.first.prize.to_i * (v.size / 3) }   
	end	

	puts "Total: #{p.total}"
		# => 688.6

end
