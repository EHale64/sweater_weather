require 'rails_helper'

RSpec.describe Credit do
  it 'should be a credit' do
    data =  "Thomas Ward"

    credit = Credit.new(data)

    expect(credit).to be_a(Credit)
    expect(credit.source).to eq('pexels.com')
    expect(credit.author).to eq(data)
    expect(credit.logo).to eq('https://theme.zdassets.com/theme_assets/9028340/1e73e5cb95b89f1dce8b59c5236ca1fc28c7113b.png')
  end
end
