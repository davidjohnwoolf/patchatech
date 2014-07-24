require "rails_helper"
require 'pry'

RSpec.describe ContactMailer, :type => :mailer do

  describe '#contact_mailer' do
    before do
      @user = { name: 'test', comments:'testing comments', email: 'test@test.com' }
      @mail = ContactMailer.contact_mailer(@user)

    end
    it 'renders Contact Request' do
      expect(@mail.subject).to eql('Contact Request')
    end

    it 'renders the sender email' do
      expect(@mail.from).to eql(['contact-form@patchatech.com'])
    end

    it 'renders the receiver email' do
      expect(@mail.to).to include('patchatech@gmail.com')
    end

    it 'assigns user_name' do
      expect(@mail.body.encoded).to match('test')
    end

    it 'assigns comments' do
      expect(@mail.body.encoded).to match('testing comments')
    end

    it 'assigns emails' do
      expect(@mail.body.encoded).to match('test@test.com')
    end

  end
end
