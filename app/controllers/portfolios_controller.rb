class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout 'portfolio'

  access all: [:show, :index], user: {except: [:destroy, :edit, :update, :create, :new, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render body: nil
  end

  def react
    @react_portfolio_items = Portfolio.react
  end

  def ruby_on_rails
    @ruby_on_rails_portfolio_item = Portfolio.ruby_on_rails_portfolio_items
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    @portfolio_item.update_attributes(portfolio_params)
    redirect_to portfolio_show_path(@portfolio_item)
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
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:id, :name, :_destroy])
  end
end
