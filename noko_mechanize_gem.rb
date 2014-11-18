#*********************************** The Required gems are

require 'open-uri'
require 'nokogiri'
require 'cgi'
require 'mechanize'
require 'open_uri_redirections'
require 'openssl'

#*********************************** The Following code for getting source code lines of a yahoo.com 

agent = Mechanize.new

uri = URI 'gmail.com'

agent.user_agent_alias = 'Linux Firefox'

page = agent.get("http://yahoo.com", :allow_redirections => :safe)
content1 =  page.body

aFile = File.open("sample.html", "w")
aFile.write(content1)
aFile.close


total_lines = Array.new

File.readlines("sample.html").each do |line|
 total_lines << line.to_s
 puts line
end




#*********************************** The Following code for getting gmail.com website Information 



#getting Nokogiri object
document =Nokogiri(open("http://builtwith.com/gmail.com"))


#getting all href of a site
result = doc.search('div/a/@href')
result.each do |k|
	@test << k.to_s.gsub("http://trends.builtwith.com/","")
end 

@cms_value = Array.new
@cms_value1 = Array.new
@e_com_value1 = Array.new 
@seo_value = Array.new
@html5_value = Array.new
@frame_work_value = Array.new
@flash_value = Array.new
@e_com_value = Array.new
@webserver = Array.new
@page_num = get_number_of_pages(@websitepath)
  if @page_num !=""
	  @page_num1 = @page_num.to_s.gsub("About","").gsub("results","").gsub("result","").gsub(",","").strip
      @no_of_pgs = @page_num1.to_i
      @no_of_pgs1 = @page_num1
  end
  @test.each do |k|
   	if k.to_s.include? "cms"
   		cms_val = k.to_s.split("/")
  		@cms_value << cms_val[-1].to_s
  		@cms_value1 << cms_val[-1].to_s
    end 
    if k.to_s.include? "shop"
    	ecom_val = k.to_s.split("/")
    	@e_com_value << ecom_val[1].to_s
    	@e_com_value1 << ecom_val[1].to_s
    end 
    @flash_value << "Yes"  if k.to_s.include? "SWFObject"
    @html5_value << "Yes" if k.to_s.include? "HTML5"
    @seo_value << "Yes" if k.to_s.include? "Meta-Keywords"
    if k.to_s.include? "framework"
    	frame_work_val = k.to_s.split("/")
     	@frame_work_value << frame_work_val[-1].to_s
    end 
  end 
  if !@frame_work_value.any? then @frame_work_value << "None" end 
  if !@cms_value.any? then @cms_value << "None" end 
  if @cms_value1.any? 
  	@cms_value1 = @cms_value1 << "Yes"
  else
    @cms_value1 = @cms_value1 << "None"
  end 
  if !@html5_value.any? then @html5_value << "None" end 
  if !@seo_value.any? then @seo_value << "None" end 
  if !@flash_value.any? then @flash_value << "None" end 
  if !@e_com_value.any? then @e_com_value << "None" end
  if @e_com_value1.any? 
      @e_com_value1 = @e_com_value1 << "Yes"
  else
  	  @e_com_value1 = @e_com_value1 << "None"
  end 
