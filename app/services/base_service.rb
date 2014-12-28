require 'github_api'

class BaseService
  def github_api
    Github.new
  end

  private

  def error(message)
    {
        message: message,
        status: :error
    }
  end

  def success(payload = nil)
    if payload
      {
          payload: payload,
          status: :success
      }
    else
      {
          status: :success
      }
    end
  end


end