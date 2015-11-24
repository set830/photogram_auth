class PhotosController < ApplicationController
  before_action :current_user_must_be_owner, :only => [:edit,:update,:destroy]

  def index
    @photos = Photo.all
    @comments = Comment.all
  end

  def current_user_must_be_owner
    @photo = Photo.find(params[:id])
    if @photo.user != current_user
      redirect_to root_url, :alert => "Not authorized"
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.caption = params[:caption]
    @photo.image = params[:image]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.caption = params[:caption]
    @photo.image = params[:image]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to "/photos", :notice => "Photo deleted."
  end
end
