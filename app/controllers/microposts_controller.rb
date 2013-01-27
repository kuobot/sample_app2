class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :edit, :update, :show]
  before_filter :correct_user,   only: [:destroy, :edit, :update]
  before_filter :admin_user,     only: :destroy


  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Congratulations! You've successfully posted your notice."
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end


  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
      if @micropost.update_attributes(params[:micropost])
      flash[:success] = "Micropost updated"
      redirect_to @micropost
    else
      render 'edit'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

private

  def correct_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    redirect_to root_path if @micropost.nil?
  end
end