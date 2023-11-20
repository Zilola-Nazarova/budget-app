class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show; end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save!
      flash[:success] = 'Category created successfully!'
      redirect_to group_purchases_path(@group)
    else
      flash.now[:notice] = 'Something went wrong!'
      render :new, locals: { group: @group }
    end
  end

  def edit; end

  def update; end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy!
    flash[:success] = 'Category was deleted successfully!'
    redirect_to groups_url
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
