class GroupsController < ApplicationController
#destory
def destroy
  @group = Group.find(params[:id])
  @group.destroy
  flash[:alert] = "Group deleted"
  redirect_to groups_path
end

#show all
  def index
      @groups = Group.all
  end

#create
  def create
    @group = Group.new(group_params)
    @group.save

     redirect_to groups_path
  end
#edit
def update
  @group = Group.find(params[:id])

  @group.update(group_params)
#if redirect_to group_path,it only shows the modified one.
  redirect_to groups_path, notice: "Update Success"
end

#to create
  def new
    @group = Group.new
  end

#to edit
def edit
  @group = Group.find(params[:id])
end

#to look up
def show
  @group = Group.find(params[:id])
end


private

def group_params
  params.require(:group).permit(:title, :description)
end

end
