    
module Caminar
    def caminar
        puts "caminando"
    end
end

module Nadar
    def nadar
        puts "caminando"
    end
end
module Desplazar
    def desplazar
        puts "desplazando"
    end
end

class Mamifero
end

class Perro < Mamifero
    include Caminar
    def ladrar
        puts "ladrando"
    end
end

class Ballena < Mamifero
        include Nadar            
end

class Hombre < Mamifero
    include Caminar
    include Nadar
    def hablar
        puts "hablando"
    end
end

class Ave
    include Caminar
end

class Pinguino < Ave
    include Nadar
end

class Aguila < Ave
    def volar
        puts "volando"
    end
end


class Reptil
end

class Cocodrilo < Reptil
    include Nadar
    include Caminar
end

class Boa < Reptil
    include Desplazar
    def constriccionar
        puts "constriccionando"
    end
end

class Cobra < Reptil
    include Desplazar

    def morder
        puts "mordiendo"
    end
end

class Anfibio
    include Nadar
end

class Sapo < Anfibio
    def saltar
        puts "saltando"
    end
            
end

class Peces
    include Nadar          
end

class Tiburon < Peces
        
end

# Casos de Prueba: Ejercicio1

def casos_de_prueba_ejercicio_uno
    un_hombre = Hombre.new
    un_hombre.caminar
    otro_hombre = Hombre.new
    otro_hombre.hablar
    un_sapo= Sapo.new
    un_sapo.saltar
    un_aguila= Aguila.new
    un_aguila.volar
    un_perro= Perro.new
    un_perro.volar
end
