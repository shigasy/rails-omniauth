class User < ApplicationRecord
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :omniauthable, omniauth_providers: %i[twitter google_oauth2]
  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      info = auth['info']
      credentials = auth['credentials']
      raw_info = auth['extra']['raw_info']

      user.email = info['email']
      user.password = Devise.friendly_token[0, 20]

      user.access_token = credentials['token']
      user.access_secret = credentials['secret']
      user.credentials = credentials.to_json

      user.name = info['name']
      user.nickname = info['nickname']
      user.description = info['description'].try(:truncate, 255)
      user.image_url = info['image']

      user.raw_info = raw_info.to_json
      case auth['provider']
      when 'google'
        user.nickname ||= info['email'].sub(/(.+)@gmail.com/, '\1')
        user.url = raw_info['link']
      when 'twitter'
        user.url = info['urls']['Twitter']
        user.website = info['urls']['Website']
      end
    end
  end
end
