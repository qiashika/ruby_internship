class Base
    def show x=0,y=0
        p "Base class : x #{x},y #{y}"
    end
end

class Derived < Base
    def show x,y
        super             #1st
        super x,y         #2nd
    #1st and 2nd call are same both will send the args to the base
        super x
        super ()     #this does not send any argument
        p "derived class : x #{x},y #{y}"
    end
end

d=Derived.new
d.show 2,27