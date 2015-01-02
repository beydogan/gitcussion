require 'github_api'

class BaseService
  def github_api
    $github
  end

  def octokit
    $octokit
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