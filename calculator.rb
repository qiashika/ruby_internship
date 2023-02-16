class Calculator

	def initialize (choice, a, b, *args)
		@choice=choice
		@a=a
		@b=b
		@args=args
	end

	def task
		case @choice.to_i
		when 1
    	add
    when 2
			if (@args!=0)
				p "More number of arguments passed expected 2"
				p "Difference of first 2 numbers"
			end
      sub
    when 3
      multiply
    when 4
			division
    else
      p "Invalid option "
		end
  end

  def add
		if (@args.size!=0)
    	p "Summation #{@args.reduce(@a+@b) {|initial_val,next_val| initial_val+next_val }}"
		else
			p "Summation #{@a+@b}"
		end
	end

  def sub
    p "Difference #{@a-@b}"
	end

  def multiply
    if (@args.size!=0)
    	p "Product #{@args.reduce(@a*@b) {|initial_val,next_val| initial_val*next_val }}"
		else
			p "Product #{@a*@b}"
		end
	end

  def division
		begin
			p "Division #{@a/@b}"
		rescue
			p "Denominator cannot be 0\n Enter another number "
			p "0"
		end 
  end
end

calc = Calculator.new(4,10,5,7,8)
calc.task