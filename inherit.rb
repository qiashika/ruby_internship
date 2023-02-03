=begin

class Being

    def initialize
        puts "abc"
    end
end

class Human < Being

    def initialize
        super
        puts "Human created"
    end
end
=end

class Being
end
class Living < Being
end
class Mammal < Living
end
class Human < Mammal
end

p Human.ancestors
p "Ashika"