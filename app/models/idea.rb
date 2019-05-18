class Idea < ApplicationRecord
    acts_as_votable cacheable_strategy: :update_columns
    has_one_attached :picture
    belongs_to :user

    validates :title, presence: true, length: {maximum: 50}
    validates :text, presence: true, length: {maximum: 255}

    picture.attach(paras[:picture])


end
