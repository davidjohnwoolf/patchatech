require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TutorialsHelper. For example:
#
# describe TutorialsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TutorialsHelper, :type => :helper do
  before do
    @tutorial = create(:tutorial)
    @user = create(:user)

  end
  describe 'check if user rated' do
    context 'the user has rated' do
      it 'checks user_rated attribute and sees that it contains the user id' do

      end
    end
    context 'the user has not rated' do
      it 'checks user_rated attribute and sees that it does not contain the user id' do
        
      end
    end
  end
end
