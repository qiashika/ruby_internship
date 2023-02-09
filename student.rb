require 'csv'
require_relative 'calculator'
class Student
	TOTAL_MARKS=400
	attr_accessor :name, :roll_number, :bengali, :english, :maths, :computer, :total, :percentage, :percentile
	def initialize name, roll, bengali,english,maths,computer,total,percentage
		@name=name
		@roll_number = roll
		@bengali = bengali
		@english = english
		@maths = maths
		@computer = computer
		@total=total
		@percentage=percentage
		@percentile=0
	end

	def calculate_total
		c= Calculator.new
		@total=c.add(@total,@bengali)
		@total=c.add(@total,@english)
		@total=c.add(@total,@maths)
		@total=c.add(@total,@computer)
	end

	def calculate_percentage
		c= Calculator.new
		@percentage=c.division(@total,TOTAL_MARKS)
		@percentage=c.multiply(@percentage,100)
	end
end

def store_file students
	File.open("StudentGrade.txt","w") do |file|
		students.each do |student|
			file.puts "#{student.name},#{student.roll_number},#{student.bengali},#{student.maths},#{student.english},#{student.computer},#{student.total},#{student.percentage}"
		end
	end
end

def read_file
	students=[]
	File.open("StudentGrade.txt","r") do |file|
		file.each_line do |line|
			data=line.split(',')
			students<<Student.new(data[0],data[1].to_i,data[2].to_i,data[3].to_i,data[4].to_i,data[5].to_i,data[6].to_i,data[7].to_f)
		end
	end
	students
end 

def display_info 
	students=read_file
	students.each do |student|
		puts "Name: #{student.name}\nRoll Number: #{student.roll_number}\nBengali: #{student.bengali}\nMaths: #{student.maths}\nEnglish: #{student.english}\nComputer: #{student.computer}\nTotal: #{student.total},Percentage: #{student.percentage}"
		puts "-"*30
	end
end

def generate_csv 
	marks=[]
	i=0
	students=read_file
	students.each do |student|
		marks[i]=student.total
		i=i+1
	end
	count=students.length
	CSV.open("students.csv","w") do |csv|
		csv<<["Name","Roll Number","Bengali","Maths","English","Computer","Total","Percentage","Percentile"]
		students.each do |student|
			list= marks.select {|num| num<student.total}
			size=list.length
			student.percentile=(size.to_f/count.to_f)*100
			csv<<[student.name,student.roll_number,student.bengali,student.maths,student.english,student.computer,student.total,student.percentage,student.percentile]
		end
 	end
end


students=[]

loop do
	puts "1. Add student"
	puts "2. Display Student Info"
	puts "3. Generate CSV file"
	puts "4. Exit"
	p "Enter your choice: "
	choice=gets.to_i

	case choice
	when 1
		p "Enter the name: "
		name=gets.strip()
		p "Enter the roll number: "
		roll=gets.to_i
		p "Enter the marks in bengali: "
		beng=gets.to_i
		p "Enter the marks in maths: "
		maths=gets.to_i
		p "Enter the marks in english: "
		eng=gets.to_i
		p "Enter the marks in computer: "
		comp=gets.to_i

		student=Student.new name,roll,beng,maths,eng,comp,0,0
		student.calculate_total
		student.calculate_percentage

		students<<student
		store_file students
	when 2
		#students = read_file
		display_info
	when 3
		#students = read_file
		generate_csv
	when 4
		break
	else 
		p "Enter a valid choice: "
		choice = gets.to_i
	end
end
