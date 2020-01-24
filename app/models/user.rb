class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: %i[github]

  has_many :user_rehearsals
  has_many :rehearsals, through: :user_rehearsals
  has_many :organized_rehearsals, class_name: "Rehearsal", foreign_key: :organizer_id
  has_many :songs_to_rehearse, through: :rehearsals, source: :song
  has_many :songs

  # validates :email, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.name = auth.info.name    assuming the user model has a name
      # user.image = auth.info.image  assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
