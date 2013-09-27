class AuthenticationsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:set_email]

  def create
    auth = request.env["omniauth.auth"]
    # Try to find authentication first
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
    #request.original_url
    if authentication
      ## If email is not in response
      user = authentication.user
      puts user.email
      session[:user_email] = user.email
      if user.email.include? "@exampleiternia.com"
        redirect_to getmail_path
      else
        # Authentication found, sign the user in.
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, authentication.user)
      end
      ######
    else
      ####### For auto generate 20 char code
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...20).map{ o[rand(o.length)] }.join
      ##########################################
      email = auth['extra']['raw_info']['email']
      puts email
      @user = User.find_by_email(email)#User.where(email: email1)
      if @user.nil?
        user = User.new
        user.apply_omniauth(auth)
        if email.nil?
          user.email = string+"@exampleiternia.com"
        end
        if user.save(:validate => false)
          ######
          ## If email is not in response
          session[:user_email] = user.email
          if user.email.include? "@exampleiternia.com"
            redirect_to getmail_path
          else
            flash[:notice] = "Account created and signed in successfully."
            sign_in_and_redirect(:user, user)
          end
          ######
        else
          flash[:error] = "Error while creating a user account. Please try again."
          redirect_to root_url
        end
      else
        @user.authentications.create(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
        flash[:notice] = "Account created and signed in successfully."
        sign_in_and_redirect(:user, @user)
      end
    end
  end

  def get_email
    if session[:user_email].nil?
      redirect_to error_page
    else
      @user = session[:user_email]
    end
  end

  def set_email

    if session[:user_email].nil?
      redirect_to error_page
    else
      email_new = params[:email]
      email_previous = session[:user_email]
      @user = User.find_by_email(email_new)
      @user1 = User.find_by_unconfirmed_email(email_new)
      if @user.nil? && @user1.nil?
        @user = User.find_by_email(email_previous)
        @user.email = email_new
        @user.save
      else
        @result = "Email Already Registered"
      end
      if @user1.nil?
      else
        @result = "Verify Your Email."
      end
    end
  end

  def error_page
    @message = "You are not authorized."
  end
end
