class ApiKeyStrategy < Warden::Strategies::Base
  def valid?
    api_key.present?
  end

  def authenticate!
    user = User.find_by(api_key: api_key)

    if user
      success!(user)
    else
      Raven.capture_message('Invalid api key')
      fail!('Invalid api key')
    end
  end

  private

  def api_key
    env['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')
  end
end
