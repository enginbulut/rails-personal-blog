module ApplicationHelper
  def login_helper(style)
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) +
        (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, class: style, method: :delete
    end
  end

  def source_helper
    return unless session[:source]

    greeting = "Thanks for visiting me from #{session[:source]}"
    content_tag(:p, greeting, class: 'source-greeting')
  end

  def copyright_generator
    "&copy; #{Time.now.year} | <b>Engin Bulut</b> All rights reserved".html_safe
  end
end
