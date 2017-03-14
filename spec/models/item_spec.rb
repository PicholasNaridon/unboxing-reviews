require 'rails_helper'

RSpec.describe Item, type: :item do

  it { should have_valid(:description).when('Test', 'hello') }
  it { should have_valid(:youtube_url).when('test.com') }
  it { should have_valid(:purchase_url).when('test.com') }
end
