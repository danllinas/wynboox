class Book < ActiveRecord::Base
  belongs_to :user
  has_many :exchanges

  def self.search(params)
    response = HTTParty.get("http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Dstripbooks&field-keywords=#{params}")
    dom = Nokogiri::HTML(response.body)
  end

end
