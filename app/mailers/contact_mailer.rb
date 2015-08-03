class ContactMailer < ApplicationMailer
	def contact(contact)
		puts "ME" * 100 
		@contact = contact
		mail(to: @contact.email, 
			subject: "PlayAmusement Contact Us")
	end
end