require 'rails_helper'

describe Excavator do

  describe 'dependencies' do
    it { should belong_to(:ticket) }
  end

  describe 'validations' do
    it { should validate_presence_of(:company_name) }
    it { should validate_presence_of(:address) }

  end
end