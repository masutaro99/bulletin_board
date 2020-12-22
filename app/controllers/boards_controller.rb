class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
  def new
    @board = Board.new
  end
  def create
    board = Board.create(board_params)
    redirect_to board
  end
  def show
    @board = Board.find_by(id: params[:id])
  end
  def edit
    @board = Board.find_by(id: params[:id])
  end
  def update
    board = Board.find_by(id: params[:id])
    board.update(board_params)
    redirect_to(board_path)
  end
  def destroy
    board = Board.find_by(id: params[:id])
    board.delete
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
