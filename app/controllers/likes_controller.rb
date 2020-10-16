class LikesController < ApplicationController
  before_action :movie_params

  def create
    Like.create(user_id: current_user.id, movie_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, movie_id: params[:id]).destroy
  end

  private

  def movie_params
    @movie = Movie.find(params[:id])
  end
end
