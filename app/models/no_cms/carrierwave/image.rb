module NoCms::Carrierwave
  class Image < ActiveRecord::Base
    translates :image

    validates :image, presence: true
  end
end
