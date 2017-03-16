require 'rails_helper'

RSpec.describe Item, type: :item do

  it { should have_valid(:description).when('Test', 'hello') }
  it { should have_valid(:youtube_url).when('https://www.test.com') }
  it { should have_valid(:purchase_url).when('https://www.youtube.com/watch?v=j4z3xv2l9_k') }

  it { should_not have_valid(:name).when(nil) }
  it { should_not have_valid(:youtube_url).when('youtube.com') }
  it { should_not have_valid(:purchase_url).when('test.com') }
end
