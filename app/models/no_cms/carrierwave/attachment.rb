module NoCms::Carrierwave
  class Attachment < ActiveRecord::Base
    translates :attachment

    validates :attachment, presence: true
  end
end
