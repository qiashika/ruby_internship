class Calculator
    def initialize
        @result=0
    end
    def add num1,num2
        @result= num1.to_i+num2.to_i
    end
    def sub num1,num2
        @result=num1.to_i-num2.to_i
    end
    def multiply num1,num2
        @result = num1.to_f*num2.to_f
    end
    def division num1,num2
        @result = num1.to_f/num2.to_f
    end
end
