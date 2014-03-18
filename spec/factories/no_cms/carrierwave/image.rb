FactoryGirl.define do
  factory :no_cms_carrierwave_image, class: NoCms::Carrierwave::Image do
    image { Faker::Lorem.sentence }
  end
end
