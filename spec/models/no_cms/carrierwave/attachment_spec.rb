require 'spec_helper'

describe NoCms::Carrierwave::Attachment do

  it_behaves_like "model with required attributes", :no_cms_carrierwave_attachment, [:attachment]

end
