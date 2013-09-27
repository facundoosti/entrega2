    
module Caminar
    def caminador
        puts "caminando"
    end
end

module Nadar
    def nadar
        puts "caminando"
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
    def volar
        puts "volando"
    end
end

class Cocodrilo < Reptil
    include Nadar
    include Caminar
end

class Boa < Reptil
    def desplazar
        puts "desplazando"
    end
    def constriccionar
        puts "constriccionando"
    end
end

class Cobra < Reptil
    def desplazar
        puts "desplazando"
    end

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
