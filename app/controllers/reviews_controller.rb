class ReviewsController < ApplicationController
    def index 
        @book = Book.find(params[:book_id])
    end 

    def new 
        @book = Book.find(params[:book_id])
    end 

    def create
        @book = Book.find(params[:book_id])
        @review	= @book.reviews.create(params.require(:review).permit(:name, :body))
        redirect_to book_path(@book)
    end

    def destroy 
        @book = Book.find(params[:book_id])
        @review = @book.reviews.find(params[:id])
        @review.destroy
        redirect_to book_path(@book)
    end 
end
