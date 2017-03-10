class GroupsController < ApplicationController
  def index
      @groups = Group.all
  end

#link to that "new" page
  def new
    @group = Group.new
  end

#to create
  def create
    @group = Group.new(group_params)
    @group.save

     redirect_to groups_path
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
