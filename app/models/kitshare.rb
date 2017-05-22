class Kitshare < ApplicationRecord
  has_many :kitsharecomments
  belongs_to :user

  paginates_per 6
end
