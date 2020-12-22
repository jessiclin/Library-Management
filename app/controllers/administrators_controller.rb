class AdministratorsController < ApplicationController

    def search 
       
    end 

    def results 
        @search = Book.search(params[:title], params[:author], params[:isbn])
    end 


end
