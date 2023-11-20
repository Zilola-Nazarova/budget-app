class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show; end

  def new; end

  def edit; end

  def update; end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy!
    flash[:success] = 'Category was deleted successfully!'
    redirect_to groups_url
  end
end
