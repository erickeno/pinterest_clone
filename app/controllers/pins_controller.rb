class PinsController < ApplicationController
  before_action :set_board
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def new
    @pin = @board.pins.build
  end

  def create
    @pin = @board.pins.build(pin_params)
    @pin.author = current_user
    if @pin.save
      flash[:notice] = "Pin has been created."
      redirect_to [@board, @pin ]
    else
      flash.now[:alert] = "Pin has not been created."
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @pin.update(pin_params)
      flash[:notice] = "Pin has been updated."
      redirect_to [@board, @pin]
    else
      flash.now[:alert] = "Pin has not been updated."
      render 'edit'
    end
  end

  def destroy
    @pin.destroy
    flash[:notice] = "Pin has been deleted."
    redirect_to @board
  end
  
  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_pin
    @pin = @board.pins.find(params[:id])
  end

  def pin_params
    params.require(:pin).permit(:name, :title)
  end
end
