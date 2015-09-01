module WelcomeHelper
  def gethost
    host = (request.host=='localhost') ? request.host+":3000" : request.host
    host+"/"
  end
end
