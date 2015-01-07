class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)

    # Find user one way
    user = User.find_by(provider: access_token.provider, uid: access_token.uid)

    # No dice? Find user another way
    if user.nil?
      user = User.find_by(:email => access_token.info.email)
    end

    # If no user found, create user via Google info
    if user.nil?
      user = create_user_from_access_token(access_token)
    end

    user
  end

  private 

  def self.create_user_from_access_token(access_token)
    data = access_token.info
    User.create(name: data["name"],
                provider: access_token.provider,
                email: data["email"],
                uid: access_token.uid ,
                password: Devise.friendly_token[0,20],
               )
  end
end
