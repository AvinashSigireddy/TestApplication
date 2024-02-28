require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'validation' do
    it "should be invalid without password"  do
      employee = FactoryBot.build(:employee,password:nil)
      expect(employee).not_to be_valid
    end

    it "should be invalid without jti"  do
      employee = FactoryBot.build(:employee,jti:nil)
      expect(employee).not_to be_valid
    end
  end

  describe 'association' do
  end

  describe 'methods' do
  end
end
