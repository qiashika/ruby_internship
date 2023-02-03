class Random_check
    def method1
        puts "hi i am public"
    end
 
    
    def method3
        self.method2
        method2 #can also call this public method using self self.method2
        puts "i am also public"
    end

    private

    def method2
        puts "hi i have been mentioned private"
    end
end

=begin
s = Random_check.new
s.method1
#s.method2  throws error because it has been made private and cannot be called outside the class defination
s.method3
=end

s1=Random_check.new
s1.method3

#protected methods also cannot be callled outside same as private
#self keyword is used with protected but not private