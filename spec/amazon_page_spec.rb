require 'amazon_page.rb'

describe AmazonPage do
 before(:each) do
  @page = AmazonPage.new
 end
 after(:each) do
  @page.close
 end
 it "should show 'Brazil on the Rise' when search for [Brazil]" do
  @page.query 'Brazil'
  @page.has_text('Brazil on the Rise').should == true
 end
 it "should bring no result when I search for [semnocao]" do
  @page.query 'semnocao'
  @page.results_count.should == 0
 end
end
