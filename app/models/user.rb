class User < ActiveRecord::Base
  enum role: [:user,:admin]

  has_many :questions, dependent: :destroy
  has_many :exams, dependent: :destroy

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

    validates :name, presence: true, length: {maximum: 50}
    validates :chatwork_id, presence: true,
      length: {maximum: 50}, uniqueness: true
    validates :email, length: {maximum: 255}
    validates :role, presence: true

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
      end
    end

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end
end
