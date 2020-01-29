class ApplicationController < ActionController::Base
  def new_session_path(scope)
    new_user_session_path
  end

  def title(text)
    content_for :title, text
  end
end
