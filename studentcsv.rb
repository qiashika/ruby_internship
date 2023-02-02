require 'csv'
=begin CSV.open('Student.csv','w') do |csv|
    csv<<["Name","Address","Class","Roll no."]
    csv<<['Ram','Kolkata|West Bengal','10','23']
    csv<<['Jon' 'Salt lake| West Bengal' ,'6','18']
    csv<<['Bob', 'Burdawan| West Bengal','12','35']
    csv<<['Makbul','Durgapur|West Bengal','12','30']
=end
file = File.new("student.txt",'r')
CSV.open("studentcsv.csv",'w',write_headers: true,headers: ['Name','Address','Class','Roll number']) do |csv|
    file.each do |call|
        call=call.chomp
        csv<<call.split('|')
    
    end
end