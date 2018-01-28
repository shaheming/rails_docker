class Investment < ApplicationRecord
  belongs_to :user
  has_many :websites

  def website
    self.websites.order(created_at: :desc).take
  end

  def current_price
    website = self.website
    get_fund_price(website.url, website.parse_directive)
  end

  def get_fund_price(url, parse_directive)
    begin
      agent = Mechanize.new
      page = agent.get url
      directive = <<-EOS
        page.#{parse_directive}
      EOS
      return eval directive
    rescue Exception => ex
      [ex.message, ex.backtrace]
    end
  end
end
