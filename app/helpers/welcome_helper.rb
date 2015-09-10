module WelcomeHelper
  def gethost
    host = (request.host=='localhost' || request.host=='lvh.me') ? request.host+":"+request.env["SERVER_PORT"] : request.host
    host = (host[0..3]=="http") ? host : "http://"+host
    host+"/"
  end
end
