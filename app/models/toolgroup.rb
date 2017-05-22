class Toolgroup < ApplicationRecord
  has_many :toolgroupcomments
  belongs_to :user

  paginates_per 5
end
