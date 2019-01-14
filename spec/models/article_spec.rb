require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'create article should be success when params is valid' do
    article = Article.create(title: 'title', text: 'text')
    expect(article).to be_valid
  end

  it 'create article should be faild when title is nil' do
    article = Article.create(title: nil)
    expect(article).to be_invalid
  end

  it 'create article should be faild when title length is too short' do
    article = Article.create(title: '1234')
    expect(article).to be_invalid
  end
end
