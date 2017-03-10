class GroupsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :eidt, :update, :destroy]
  before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]

#destory
def destroy
   @group.destroy
   redirect_to groups_path, alert: "Group deleted"

end

#show all
  def index
      @groups = Group.all
  end

#create
def create
  @group = Group.new(group_params)
  @group.user = current_user
  if @group.save
    redirect_to groups_path
  else
    render :new
  end
end

#edit
def update
  if @group.update(group_params)
#if redirect_to group_path,it only shows the modified one.
  redirect_to groups_path, notice: "Update Success"
  else
    render :edit
  end
end

#to create
  def new
    @group = Group.new
  end

#to edit
def edit
end

#to look up
def show
  @group = Group.find(params[:id])
end


private
def find_group_and_check_permission
    @group = Group.find(params[:id])

    if current_user != @group.user
      redirect_to root_path, alert: "You have no permission."
    end
end

def group_params
  params.require(:group).permit(:title, :description)
end

end
