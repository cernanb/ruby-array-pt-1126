require 'pry'

def start_cli
    # an array of strings - brand names
    shoes = []
    input = nil

    while input != "exit"
        puts "What would you like to do ?"
        puts "(a) add | (p) print | (ps) print sorted | (c) count | (d) delete | (t) type"

        input = gets.chomp
        
        if input == 'a'
            puts "What brand would you like to add?"
            brand = gets.chomp
            # shoes.push(brand)
            shoes << brand.downcase
        elsif input == 'p' 
            printer(shoes)
        elsif input == 'ps' 
            printer(shoes.sort)
        elsif  input == 'c'
            puts "There are #{shoes.length} shoes."
        elsif  input == 'd'
            puts "Input the name of the shoe you want to remove"
            shoe = gets.chomp
            if shoes.delete(shoe.downcase)
                puts "#{shoe} was successfully deleted!"
            else
                puts "Item not found...cannot delete"
            end
        elsif input == 't'
            puts "Enter in a type:"
            type = gets.chomp

            arr = shoes.select do |shoe|
                shoe.include?(type.downcase)
            end
            printer(arr)
        end
    end
end

def printer(shoes)
    shoes.each.with_index(1) do |brand, index|
        binding.pry
        puts "#{index}. #{brand.split(' ').map{|w| w.capitalize}.join(' ')}"
    end
end

start_cli