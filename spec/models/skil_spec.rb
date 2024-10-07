require 'rails_helper'

RSpec.describe Skil, type: :model do
  it { should validate_presence_of :name }
end
