class Item < ActiveRecord::Base
  has_many :lists, through: :list_items
  has_many :list_items
end
