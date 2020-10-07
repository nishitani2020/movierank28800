class CommentsController < ApplicationController
 def create
  @movie = Movie.find(params[:movie_id])
  @comment = @movie.comments.new(comment_params)
  @comment.save
  redirect_to movie_path(@movie.id)
 end

 private
 
 def comment_params
  params.require(:comment).permit(:comment).merge(user_id: current_user.id, movie_id: params[:movie_id])
 end
end
