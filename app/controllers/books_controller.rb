class BooksController < ApplicationController
    def index 
        @books = Book.all 
    end 

    def new
        @book = Book.new
    end

    def create 
        @book = Book.new(params.require(:book).permit(:title, :author, :isbn, :copies))

        if (@book.save)
            redirect_to @book 
        else 
            render 'new'
        end 
    end 

    def show 
        @book = Book.find(params[:id])
    end 

    def update				
        @book = Book.find(params[:id])				
        if	@book.update(params.require(:book).permit(:title, :author, :isbn, :copies))							
            redirect_to administrators_search_path	
        else					
            render 'edit'				
        end		
    end	
    
    def edit
        @book = Book.find(params[:id])
    end

    def destroy 
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end 
    
    def checkout 
        @book = Book.find(params[:book_id])
        @book.copies -= 1 
        if @book.save 
            redirect_to administrators_search_path
        else     
            path = administrators_results_path + "?title=#{params[:title]}&author=#{params[:author]}&isbn=#{params[:isbn]}"
            redirect_to path, notice: 'Unable to check out book'
        end 
    end 

end
