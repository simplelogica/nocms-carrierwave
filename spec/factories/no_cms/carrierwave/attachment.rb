FactoryGirl.define do
  factory :no_cms_carrierwave_attachment, class: NoCms::Carrierwave::Attachment do
    attachment { Faker::Lorem.sentence }
  end
end
