module BooksHelper

  def give_me_title(item)
    @response.css("#result_#{item} > div > div > div > div.a-fixed-left-grid-col.a-col-right > div.a-row.a-spacing-small > a > h2").text
  end

  def give_me_author(item)
    @response.css("#result_#{item} > div > div > div > div.a-fixed-left-grid-col.a-col-right > div.a-row.a-spacing-small > div > span:nth-child(2) > a").text
  end
# //*[@id="result_0"]/div/div/div/div[1]/div/div/a/img
  def give_me_image(item)
    xpathStr = "//*[@id='result_#{item}']/div/div/div/div[1]/div/div/a/img";
    p xpathStr
    @response.xpath(xpathStr)[0].to_a[1][1]
  end

end
