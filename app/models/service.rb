class Service < ActiveRecord::Base
    belongs_to :user
    validates :name, :kind, :level,  presence: true
end
  