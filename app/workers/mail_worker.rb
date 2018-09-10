class MailWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "Wooooooow"
  end
end
