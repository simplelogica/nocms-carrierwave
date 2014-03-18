require 'spec_helper'

describe NoCms::Carrierwave::Image do

  it_behaves_like "model with required attributes", :no_cms_carrierwave_image, [:image]

end
