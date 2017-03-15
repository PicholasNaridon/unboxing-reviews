require 'rails_helper'

RSpec.describe Item, type: :item do

  it { should have_valid(:description).when('Test', 'hello') }
  it { should have_valid(:youtube_url).when('https://www.youtube.com/watch?v=wzjWIxXBs_s&t=26507s') }
  it { should have_valid(:purchase_url).when('https://www.google.com/') }
end
