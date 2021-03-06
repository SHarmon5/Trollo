class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :set_board
  def index
    redirect_to board_path(@board)
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    @board.lists.create_list(list_params, @board.id)
    redirect_to board_lists_path(@board)
  end
 
  def edit

  end

  def update
    @board.lists.update_list(list_params, @list.id)
    redirect_to board_lists_path(@board)
  end

  def destroy
    List.delete_list(@list.id)
    redirect_to board_list_path(@board_id)
  end


  private

  def set_board
    if params[:board_id] != nil
      @board = Board.single_board(current_user.id, params[:board_id])
    elsif params[:board_id] == nil
      @board = Board.single_board(current_user.id, @list.board_id)
    end
  end
  
  def set_list
    @list = List.single_list(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :details, :due_date)
  end
end
