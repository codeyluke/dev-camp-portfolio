class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    Portfolio.create(portfolio_params)
    redirect_to portfolios_path, notice: 'Successfully created the portfolio'
  end

  def edit
  end

  def update
    @portfolio_item.update_attributes(portfolio_params)
    redirect_to portfolio_path
  end

  def show
  end

  def destroy
    @portfolio_item.destroy
    redirect_to portfolios_path, notice: 'Successfully deleted the porfolio'
  end

  private
  
  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
