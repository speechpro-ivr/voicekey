class LandingController < ApplicationController
  def index
  end

  def check_registration
    @cib = Client.find_by_ani(params[:ani])
    if @cib.nil?
      redirect_to :controller => 'enrollment', :format => params[:format]
    else
      redirect_to :controller => 'verification', :format => params[:format]
    end
  end
end
