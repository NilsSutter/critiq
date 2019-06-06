  class CustomFailure < Devise::FailureApp
    def redirect_url
      root
    end

    # You need to override respond to eliminate recall
    def respond
      raise
      if http_auth?
        http_auth
      else
        redirect
      end
    end
  end
