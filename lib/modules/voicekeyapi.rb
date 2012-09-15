module VoiceKeyApi
  class EnrollRequest
    attr_accessor :responce
    include HTTParty
    format :xml
    base_uri = 'http://voicekey.speechpro.com/avis/vk_api2/enroll.php'.
  end
end