require 'spec_helper'

describe User do
  let!(:valid_attributes) {
    {
      first_name: 'Anthony',
      last_name: 'Hernandez',
      email: "anthony@mail.com",
      password: 'monkey123',
      password_confirmation: 'monkey123'
    }
  }

  context 'validations' do
    # Note that this user is not saved
    let(:user) { User.new(valid_attributes) }

    # We create a user in the database first to make sure valid attributes are indeed valid (i.e. aren't rejected)
    before do
      User.create(valid_attributes)
    end

    it 'requires an email' do
      expect(user).to validate_presence_of(:email)
    end

    it 'requires a unique email' do
      expect(user).to validate_uniqueness_of(:email)
    end

    it 'requires a unique email (case insensitive)' do
      user.email = 'ANTHONY@MAIL.COM'
      expect(user).to validate_uniqueness_of(:email)
    end
  end

  context '#downcase_email' do
    it 'makes the email attribute lower case' do
      user = User.new(valid_attributes.merge(email: 'ANTHONY@MAIL.COM'))
      expect{ user.downcase_email }.to change{ user.email }.
        from('ANTHONY@MAIL.COM').
        to('anthony@mail.com')
    end

    it 'downcases an email before saving' do
      user = User.new(valid_attributes)
      user.email = 'ANTHONY@MAIL.COM'
      expect(user.save).to be true
      expect(user.email).to eq('anthony@mail.com')
    end
  end
end
