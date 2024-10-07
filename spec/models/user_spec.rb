require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :surname }
  it { should validate_presence_of :nationality }
  it { should validate_presence_of :country }
  it { should validate_presence_of :gender }
  it { should validate_presence_of :email }
  it { should validate_presence_of :age }
end
