# == Schema Information
#
# Table name: reviews
#
#  id                 :bigint           not null, primary key
#  nickname           :string
#  body               :text             not null
#  overall            :integer          not null
#  food               :integer          not null
#  service            :integer          not null
#  ambience           :integer          not null
#  value              :integer          not null
#  user_id            :bigint           not null
#  restaurant_id      :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  reviewer_firstname :string
#  reviewer_lastname  :string
#
class Review < ApplicationRecord

    attr_accessor :user_email
    validates :body, :food, :service, :ambience, :value,:reviewer_firstname, presence: true
    validates :food, :service, :ambience, :value, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    # validate :calculate_overall_rating
    validates :body, length: { maximum: 2500, message: "must be 2500 characters or less" }

    belongs_to :user

    belongs_to :restaurant
    
    # def calculate_overall_rating
    #     # Calculate the average of the other fields
    #     avg_rating = (food + service + ambience + value) / 4.0
    
    #     # Validate that the overall rating is equal to the average
    #     if overall != avg_rating
    #         errors.add(:overall, "must be the average of food, service, ambience, and value")
    #     end
    # end
end
