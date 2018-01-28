class Admin::InvestmentController < ApplicationController
  before_action :authenticate_user!

  def index
    invest_websites = current_user.investments
    @investments = invest_websites.map do |invest|
      {
          name: invest.name,
          url: invest.website.url,
          current_price: invest.current_price,

      }
    end
  end

  def show
    @invest = current_user.websites.where(id: params[:id]).take
  end

  def new

  end

  def create
    current_user.investment.create!(website_params)
  end

  private

  def website_params
    params.require(:investment).permit(:url, :name, :description, :parse_directive)
  end



end
