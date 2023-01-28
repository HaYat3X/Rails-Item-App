class Movie < ApplicationRecord
  mount_uploader :movie, MovieUploader
  validates :movie, presence: true
  validates :title, presence: true
  validates :contents, presence: true
  validates :tag, presence: true
end
