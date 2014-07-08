require 'rails_helper'

RSpec.describe Tutorial, :type => :model do

  describe 'associations' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :category }
  end

end
