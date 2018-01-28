class Admin::InvestmentController < ApplicationController
  before_action :authenticate_user!

  def index
    invest_websites = current_user.websites
    @investments = invest_websites.map do |invest|
      {
          name: invest.name,
          url: invest.url,
          price: get_fund_price(invest.url, invest.parse_directive)
      }
    end
  end

  def show
    @invest = current_user.websites.where(id: params[:id]).take
  end

  def create
    current_user.websites.create!(website_params)
  end

  private

  def website_params
    params.require(:investment).permit(:url, :name, :description, :parse_directive)
  end


  def get_fund_price(url, parse_directive)
    begin
      agent = Mechanize.new
      page = agent.get url
      directive = <<-EOS
        page.#{parse_directive}
      EOS
      eval directive
    rescue Exception => ex
      [ex.message, ex.backtrace]
    end
  end
end
