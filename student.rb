class Student
    @@i=0
    @@Values=Array.new(0,0,0)
    def initialize name,marks
        @name=name
        @marks=marks
    end
    def total
        t=@marks.sum(0.0)
        @@Values[@@i]=t
        @@i=@@i+1
        return t
    end
    def percentage
        p=(@marks.sum(0.0)/@marks.size)*100
    end
    def percentile
        @@Values.sort
        count=0
        for i in 0..@@Values.length
            if @@Values[i]<@@Values[i+1]
                count+=1
            end
        end
        p=(count/@@Values.length)*100
    end
    def write_file
        File.open("StudentData.txt",'a') do |line|
            line.puts @name+" "
            line.puts total.to_s+" "
            line.puts @marks.to_s+" "
            line.puts percentage.to_s+" "
            line.puts percentile.to_s+"\r"
        end
    end
end
mark=[45,65,89,90]
s1=Student.new "Ashika",mark
s1.write_file