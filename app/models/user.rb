class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  
         has_many :categories
         has_many :tasks, through: :categories

  validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

#   devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :github]

#   def self.from_omniauth(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#     user.email = auth.info.email
#     user.password = Devise.friendly_token[0, 20]
#     user.first_name = auth.info.name   # assuming the user model has a name
#     # user.image = auth.info.image # assuming the user model has an image
#     # If you are using confirmable and the provider(s) you use validate emails, 
#     # uncomment the line below to skip the confirmation emails.
#     # user.skip_confirmation!
#   end
# end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  # def self.from_omniauth(access_token)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first

  #   # Uncomment the section below if you want users to be created if they don't exist
  #   # unless user
  #   #     user = User.create(name: data['name'],
  #   #        email: data['email'],
  #   #        password: Devise.friendly_token[0,20]
  #   #     )
  #   # end
  #   user
  # end

  has_many :authorizations

  # omniauth facebook provider
  def self.from_omniauth(auth, current_user)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.first_name = auth.info.name
    end

    # check for existing authorization
    # Find or create Authorization with: provider, uid, token and secret
    authorization = Authorization.where(
      :provider => auth.provider, 
      :uid => auth.uid.to_s, 
      :token => auth.credentials.token, 
      :secret => auth.credentials.secret
    ).first_or_initialize

    if authorization.user.blank?
      user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user

      # User.where(email: auth['info']['email']).first_or_create
      # p auth.info
      # p auth.email
      # p user
      # save user related data in user table
      if user.blank?
        User.new(
          :email            => auth.info.email,
          :password         => Devise.friendly_token[0,10],
          :name             => auth.info.name,
          :locations        => auth.info.location,
          :image_url        => auth.info.image
        )
        # since twitter don't provide email, 
        # so you need to skip validation for twitter.
        # auth.provider == "twitter" ?  user.save!(:validate => false) :  user.save!
      end

      # store authorization related data in authorization table
      authorization.username = auth.info.nickname
      authorization.user_id = user.id
      authorization.save!
    end
    authorization.user
  end
end
