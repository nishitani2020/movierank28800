class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.new
    @comments = @movie.comments.includes(:user)
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:image, :name, :explanation, :category_id).merge(user_id: current_user.id)
  end

end