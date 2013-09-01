class MoviesController < ApplicationController
	def index
	  @movies = Movie.all
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes(params[:@movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def new
    #default: render 'new' template
  end

  def create
    @movies = Movie.create!(params[:movie])
    #notice flashes up to inform you that movie addition was successful
    flash[:notice] = "#{@movies.title} was successfully created."
    # redirect back to GET movie_path other localhost:3000/en/movies
    redirect_to movies_path
  end
  
  def show
   id = params[:id] # retrieve movie ID from URL route
   @movie = Movie.find(id) # look up movie by unique ID
   # will render app/views/show.html.haml

# BUG: check @movie for validity
  end 
#   %h1= @movie.title

# will give "undefined method 'title' for nil:NilClass" if @movie is nil
end


