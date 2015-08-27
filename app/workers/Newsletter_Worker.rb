class NewsletterWorker 
	include Sidekiq::Worker 

	def perform(user_id)
		user = User.find(@user_id)
		UserNewsletter.activation.deliver
	end
end
