class A
    def self.info
        "This is class method declaration type 1"
    end
end

class B
end
def B.info
    "This is class method declaration type 2"
end

class C
    class << self
        def info
            "This is class method declaration type 3"
        end
        def info1
            "Multiple class methods together"
        end
    end
end
