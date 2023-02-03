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
        @result = num1.to_i*num2.to_i
    end
    def division num1,num2
        @result = num1.to_i/num2.to_i
    end
end

c = Calculator.new
puts "Enter your choice 1.add\n2.sub\n3.multiply\n4.division"
choice = gets.chomp()

puts "Enter a number"
num1=gets.chomp()

puts "Enter a number"
num2=gets.chomp()

case choice.to_i
when 1
   p "#{num1} + #{num2} = #{c.add num1,num2}"
when 2
    p "#{num1} - #{num2} = #{c.sub num1,num2}"
when 3
    p "#{num1} * #{num2} = #{c.multiply num1,num2}"
when 4
    begin
        p "#{num1} / #{num2} = #{c.division num1,num2}"
    rescue
        p "Denominator cannot be 0\n Enter another number "
        num2=gets.chomp()
        p "#{num1} / #{num2} = #{c.division num1,num2}"
    end
else
    p "Invalid option "
end