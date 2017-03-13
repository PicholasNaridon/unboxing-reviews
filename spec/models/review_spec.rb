require 'rails_helper'

RSpec.describe Review, type: :review do

  it { should have_valid(:body).when('Test', 'hello') }
  it { should_not have_valid(:body).when(nil) }

  it { should have_valid(:rating).when(1, 2) }
  it { should_not have_valid(:rating).when(nil, 6) }
end
