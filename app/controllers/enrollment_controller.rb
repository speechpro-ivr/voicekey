require 'uri'
require 'net/http'

class EnrollmentController < ApplicationController
  def index
  end

  def enroll
    url = URI.parse("http://voicekey.speechpro.com/avis/vk_api2/enroll.php")
  end
end
