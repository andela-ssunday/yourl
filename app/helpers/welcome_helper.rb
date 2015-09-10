module WelcomeHelper
  def gethost
    host = (request.host=='localhost') ? request.host+":"+request.env["SERVER_PORT"] : request.host
    host+"/"
  end
end
