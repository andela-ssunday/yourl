class ViewWorker
  include Sidekiq::Worker

  def perform(link_id, referrer, remote_ip, country)
    View.create(link_id: link_id, referrer: referrer, request_ip: remote_ip, country: country)
  end
end
