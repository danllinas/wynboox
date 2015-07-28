class ExchangesController < ApplicationController
  def new
  end

  def show
    @exchange = Exchange.find(params[:id])
  end

  def edit
  end

  def create
    @exchange = Exchange.new(exchange_params)
    if @exchange.save
      @exchange.book.status = "requested"
      flash[:success] = "You requested the book!"
      redirect_to exchange_path
    else
      flash[:alert] = "Something went wrong. Try agian."
      render books_path
    end
  end

  def destroy
  end

  private
    def exchange_params
      params.require(:exchange).permit(:book_owner_id, :borrower_id, :book_id)
    end
end
