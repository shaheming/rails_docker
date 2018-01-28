class Website < ApplicationRecord
  belongs_to :user
  belongs_to :investment
end
