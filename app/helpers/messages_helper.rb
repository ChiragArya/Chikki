#Image-Select extension for Chosen Pasted ImageSelect.jquery.js and ImageSelect.css files into your project and require them in application.js and application.css.scss
module MessagesHelper
  def recipients_options
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}' data-img-src='#{gravatar_image_url(user.email, size: 50)}'>#{user.name}</option>"
    end
    s.html_safe
  end
end