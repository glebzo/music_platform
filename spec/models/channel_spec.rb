require 'rails_helper'

RSpec.describe Channel, type: :model do
  it { should have_many(:tracks) }
end