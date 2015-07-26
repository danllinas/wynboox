module BooksHelper

  def give_me_title(item)
    @response.css("#result_#{item} > div > div > div > div.a-fixed-left-grid-col.a-col-right > div.a-row.a-spacing-small > a > h2").text
  end

  def give_me_author(item)
    @response.css("#result_#{item} > div > div > div > div.a-fixed-left-grid-col.a-col-right > div.a-row.a-spacing-small > div > span:nth-child(2) > a").text
  end

  def give_me_image(item)
    @response.xpath('//*[@id="result_#{item}"]/div/div/div/div[1]/div/div/a/img')[0].to_a[1][1]
  end

end
