class User < ApplicationRecord

  attr_accessor :update_profile

  validates :email, presence: true
  validates :email, length: { in: 5..600 }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be an email" }
  validates  :email, uniqueness: true

  validate :validate_full_profile, if: :update_profile
  before_validation :ensure_session_token

  def validate_full_profile
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true, length: { in: 10..15 }, format: { with: /\A\d{10}\z|\A\d{3}-\d{3}-\d{4}\z|\A\(\d{3}\)\d{3}-\d{4}\z/, message: "Must be a valid phone number" }
  end

    # validates :first_name, :last_name, :email, :phone_number, :session_token, presence: true, 
    # validates :email, length: {in: 5..600}, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be an email" }
    # validates :session_token, :email, uniqueness: true
    # validates  :email, :session_token, presence: true
    # validates :email, length: {in: 5..600}, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be an email" }
    # validates :session_token, :email, uniqueness: true
    # validates :phone_number, length: { in: 10..15 }, format: { with: /\A\d{10}\z|\A\d{3}-\d{3}-\d{4}\z|\A\(\d{3}\)\d{3}-\d{4}\z/, message: "Must be a valid phone number" }


  
    # has_many :reservations, dependent: :destroy
    # has_many :reviews, dependent: :destroy
    # has_many :notifications, dependent: :destroy
  
    # after_initialize :ensure_session_token

    # def self.find_by_credentials(email)
    #   user = User.find_by(email: email)
    #   user ? user : nil
    # end
    def self.find_by_credentials(credential)
      user = nil
      if URI::MailTo::EMAIL_REGEXP.match?(credential)
        # debugger
        user = User.find_by(email: credential)
        return user
      end
      nil
    end
  
    def self.generate_session_token
      SecureRandom.urlsafe_base64(16)
    end
  
    def reset_session_token!
      self.session_token = self.class.generate_session_token
      self.save!
      self.session_token
    end
  
    private
  
    def ensure_session_token
      self.session_token ||= self.class.generate_session_token
    end
  
    # def reset_session_token!
    #   self.session_token = generate_unique_session_token
    #   self.save!
    #   self.session_token
    # end
  
    def generate_unique_session_token
      token = SecureRandom::urlsafe_base64(16)
      while User.exists?(session_token: token)
        token = SecureRandom::urlsafe_base64(16)
      end
      token
    end

    # private

    # def ensure_session_token
    #     self.session_token ||= generate_unique_session_token
    # end
end