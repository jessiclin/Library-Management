class Book < ApplicationRecord
    has_many :reviews, dependent: :destroy
    validates :title, presence: true
    validates :author, presence: true
    validates :isbn, presence: true, uniqueness:true, numericality:true, length: {is: 10}
    validates :copies , presence: true, numericality: {only_integer: true}

    def self.search(title, author, isbn)
        books = Book.where("copies > ?", 0)
  
        books = books & Book.where("(title = ?) or (title like ?) or (title like ?) or (title like ?)", "#{title}", "% #{title} %", "#{title} %", "% #{title}") if !title.blank?
        books = books & Book.where("(author = ?) or (author like ?) or (author like ?) or (author like ?)", "#{author}", "% #{author} %", "#{author} %", "% #{author}") if !author.blank? 
        books = books & Book.where("isbn like ?", "isbn") if !isbn.blank? 
        return books 
    end 
end
