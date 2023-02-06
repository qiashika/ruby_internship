require 'csv'
class Student
    attr_accessor :name, :roll_number, :bengali, :english, :maths, :computer, :total, :percentage, :percentile
    def initialize name, roll, bengali,english,maths,computer,t,per,p
        @name=name
        @roll_number = roll
        @bengali = bengali
        @english = english
        @maths = maths
        @computer = computer
        @total=t
        @percentage=per
        @percentile=p
    end

    def calculate_total
        @total = @bengali+@english+@maths+@computer
    end
    def calculate_percentage
        @percentage=(@total/400.0)*100
        p @percentage
    end
    def calculate_percentile
        @percentile=(@percentage/10).floor
    end
    def to_s
        "Name: #{@name}\nRoll Number: #{@roll_number}\nBengali: #{@bengali}\nMaths: #{@maths}
        \nEnglish: #{@english}\nComputer: #{@computer}"
    end
end
def store_file students
    File.open("StudentGrade.txt","w") do |file|
        students.each do |student|
            file.puts "#{student.name},#{student.roll_number},#{student.bengali},#{student.maths},#{student.english},#{student.computer},#{student.total},#{student.percentage},#{student.percentile}"
        end
    end
end

def read_file
    students=[]
    File.open("StudentGrade.txt","r") do |file|
        file.each_line do |line|
            data=line.split(',')
            students<<Student.new(data[0],data[1].to_i,data[2].to_i,data[3].to_i,data[4].to_i,data[5].to_i,data[6].to_i,data[7].to_f,data[8].to_f)
        end
    end
        students
end    
def display_info students
    students.each do |student|
        puts student
        puts "-"*30
    end
end
def generate_csv students
    CSV.open("students.csv","w") do |csv|
        csv<<["Name","Roll Number","Bengali","Maths","English","Computer","Total","Percentage","Percentile"]
        students.each do |student|
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

        student=Student.new name,roll,beng,maths,eng,comp,0,0,0
        student.calculate_total
        student.calculate_percentage
        student.calculate_percentile

        students<<student
        store_file students
    when 2
        students = read_file
        display_info students
    when 3
        students = read_file
        generate_csv students
    when 4
        break
    else 
        p "Enter a valid choice: "
        choice = gets.to_i
    end
end
