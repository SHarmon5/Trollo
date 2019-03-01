class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @list = List.all_lists(@board.id)
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    List.create_list(list_params, current_user.id)
    redirect_to lists_path
  end

  def edit

  end

  def update
    List.update_list(@list_id, list_params)
    redirect_to lists_path
  end

  def destroy
    List.delete_list(@list.id)
    redirect_to lists_path
  end


  private
  def set_board
    @board = Board.find(params[:board_id])
  end
  def set_list
    @list = List.single_list(current_user.id, params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
