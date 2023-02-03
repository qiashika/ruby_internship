class Cons
    C1 = 123
    C2 = 345
    C3 = 654
    def show
        print C1, ",",C2
    end
end
#p C3 thorws error uninitialized constant
p Cons::C3