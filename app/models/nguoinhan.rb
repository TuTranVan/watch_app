class Nguoinhan < ApplicationRecord
  belongs_to :donhang, class_name: Donhang.name, foreign_key: "madh"
end
