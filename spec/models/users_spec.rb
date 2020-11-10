require 'rails_helper'

RSpec.describe Users, type: :model do
  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :password}
    it {should validate_presence_of :password_confirmation}
    # it {should validate_presence_of :api_key}
  end
end
