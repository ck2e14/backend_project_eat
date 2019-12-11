class ApplicationController < ActionController::API
  #  before_action :authorized
 
  def encode_token(payload)
    JWT.encode(payload, ENV["RAILS_SECRET"])
  end
 
  def auth_header
    request.headers['Authorization']
  end
 
  def decoded_token
    if auth_header
      token = auth_header.split(ENV["RAILS_SECRET"])[1]

      begin
        JWT.decode(token, '', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
 
  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end
 
  def logged_in?
    !!current_user
  end
 
  def authorized
    render json: { message: 'You must be logged to be granted access.' }, status: :unauthorized unless logged_in?
  end
end
