require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'associations' do
    it { should have_many :tutorials }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :username }
  end

end
