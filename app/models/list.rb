class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :list_items
  has_many :list_items
  validates_presence_of :name
end
