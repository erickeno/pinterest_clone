class BoardsController < ApplicationController

  before_action :set_board, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: "Board has been updated."
    else
      flash.now[:alert] = "Board has not been updated."
      render "edit"
    end
  end

  def destroy
    @board.destroy
    flash[:notice] = "Board has been deleted."
    redirect_to root_path
  end

  private

  def set_board
    @board = Board.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The board you were looking for could not be found."
    redirect_to boards_path
  end

  def board_params
    params.require(:board).permit(:title, :description)
  end
end
