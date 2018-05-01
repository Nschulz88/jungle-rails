require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user1 = User.new({
      name: "name",
      email: "n@n.com", 
      password: '12345',
      password_confirmation: '12345'
    })
  end

  describe 'Validations' do
    it "user gets created when given valid parameters" do
      expect(@user1).to be_valid
    end

    it "must be created with a password and a mathcing password_confirmation" do
      @user1.password_confirmation = '5432'
      expect(@user1).to_not be_valid
    end

    it "requires a password AND a password_confirmation" do
      @user1.password_confirmation = nil
      expect(@user1).to_not be_valid
    end

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it "should not allow user with same e-mail to register" do 
      @user1.save
      @user2 = User.new({
        name: "name2",
        email: "n@n.com", 
        password: '123456',
        password_confirmation: '123456',
      })
      expect(@user2).to_not be_valid
      @user1.destroy
    end

    it "needs a name to register" do
      @user1.name = nil
      expect(@user1).to_not be_valid
    end

    it "needs an email to register" do
      @user1.email = nil
      expect(@user1).to_not be_valid
    end

    it "password should be at least 5 characters" do
      @user1.password = '123'
      @user1.password_confirmation = '123'
      expect(@user1).to_not be_valid
    end
  end


  describe '.authenticate_with_credentials' do

    it "should find a user based on the given email" do
      @user1.save
      @user2 = User.authenticate_with_credentials('n@n.com', '12345')
      expect(@user2).to eq(@user1)
    end

    it "should find & authenticate user with whitespaces in entered email" do
      @user1.save
      @user2 = User.authenticate_with_credentials('   n@n.com   ', '12345')
      expect(@user2).to eq(@user1)
    end

    it "should find & authenticate user regardless of case used" do
      @user1.save
      @user2 = User.authenticate_with_credentials('N@n.cOM', '12345')
      expect(@user2).to eq(@user1)
    end
   

  end
end