class Intro < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :link, presence: true

    mount_uploader :image, IntroUploader

    scope :published, -> { where(is_hidden: false) }
end
