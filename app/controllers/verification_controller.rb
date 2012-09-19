class VerificationController < ApplicationController
  def index 
  end

  def verify
  	passphrase = params[:passphrase]
  	vk_api_uri = 'http://voicekey.speechpro.com/avis/vk_api2/enroll_verify.php?apikey=stc'

  	@card_id = Client.find_by_ani(params[:ani]).card_id

  	responce = RestClient.post vk_api_uri, :ID=>@card_id ,:file1 => passphrase
  	doc = Nokogiri::XML(responce)



  	if doc.xpath('EnrollVerify').attr('Status').text == 'OK'
      if doc.xpath('/EnrollVerify/CardCompareResult/VoiceKeyScore').text.to_f > 0.65 
  		  redirect_to :action => 'success', :format => params[:format]	
      else
        redirect_to :action => 'error', :format => params[:format]
      end
  	else
  		redirect_to :action => 'error', :format => params[:format]
  	end
  end

  def success
  	
  end

  def error
  	
  end
end
