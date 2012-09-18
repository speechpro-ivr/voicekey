require 'uri'
require 'net/http'


class EnrollmentController < ApplicationController
  def index
  end

  def enroll
  	file1 = params[:attempt1]
		file2 = params[:attempt2] 
  	file3 = params[:attempt3]

		vk_api_uri = 'http://voicekey.speechpro.com/avis/vk_api2/enroll.php?apikey=stc' 	
    
  	responce = RestClient.post vk_api_uri, :file1 => file1, :file2=>file2, :file3=>file3
  	doc = Nokogiri::XML(responce)
  	if doc.xpath('Enroll').attr('Status').text == 'OK'
	  	@client = Client.new(:ani => params[:ani], :card_id => doc.xpath('Enroll').attr('CardID').text)
	  	@client.save  	
	  	redirect_to :action => 'success', :format => params[:format]	
  	else
  		redirect_to :action => 'error', :format => params[:format]
  	end
  end

  def success
  end

  def error
  end
end
