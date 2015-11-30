module UsersHelper
	def gravatar_for(user)
		url = "http://sarthak.co/images/vitlogo.png"
		image_tag(url , alt: user.name , class: "gravatar")
	end
end
