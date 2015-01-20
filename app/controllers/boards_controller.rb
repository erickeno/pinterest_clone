class BoardsController < ApplicationController
  def index
   @boards = Board.all 
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:notice] = "Board has been created."
      redirect_to @board
    else
      flash.now[:alert] = "Board has not been created."
      render 'new'
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
   @board = Board.find(params[:id]) 
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to @board, notice: "Board has been updated."
    else
      flash.now[:alert] = "Board has not been updated."
      render "edit"
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :description)
  end
end
