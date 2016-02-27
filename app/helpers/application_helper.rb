module ApplicationHelper
  # gravatar uses md 5 user email hash
  def gravatar_for(user, options = {size: 150})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
    
  end
end
