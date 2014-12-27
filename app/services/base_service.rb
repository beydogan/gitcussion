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

  def success
    {
        status: :success
    }
  end
end