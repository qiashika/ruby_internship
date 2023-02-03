class Book
    attr_reader :title, :pages
    attr_writer :title, :pages
    attr_accessor :author
end

b=Book.new
b.title="Harry potter"
b.pages=500
b.author="jk rowling"

p "The book #{b.title} is written by #{b.author} has #{b.pages} pages"

