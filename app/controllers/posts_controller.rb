class PostsController < ApplicationController

	def index
		@posts = current_user.posts
		render :index
	end

	def new
		@post = Post.new
		render :new
	end

	def create
		@trip = Trip.find(params[:trip_id])
		@post = @trip.posts.create(post_params)
		redirect_to trip_path(@trip)
	end

 	def show
		@post = Post.find(params[:id])
		render :show
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		post.update_attributes(post_params)
		flash[:success] = "Post updated"
		redirect_to post
	end

	def destroy
    post = Post.find(params[:id])
    post.destroy
  	redirect_to "/trips"
	end

private

	def post_params
		params.require(:post).permit(:title, :description, :context, :photo_url)
	end

end

