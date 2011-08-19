require 'watir-webdriver'

class AmazonPage
 def initialize
  @page = Watir::Browser::new :firefox
  @page.goto 'http://www.amazon.com'
 end 
 def close
  @page.quit
 end
 def query(parameter)
  @page.text_field(:id=>'twotabsearchtextbox').set parameter
  @page.send_keys :enter
 end
 def has_text(text)
  @page.text.include? text
 end
 def results_count
    if @page.text.include? 'did not match'
     0
    else
     @page.div(:id=>'resultCount').text.split(' ')[5].gsub(',','').to_i
    end
 end
end
