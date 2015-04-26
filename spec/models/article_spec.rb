require 'rails_helper'

RSpec.describe Article, type: :model do
  it "is valid with a source and title" do
    article = Article.new(source: "source", title: "this is a great article")

    expect(article).to be_valid
  end

  it "is not valid without a source" do
    article = Article.new(source: nil, title: "this is a great article")

    expect(article).not_to be_valid
  end

  it "is not valid without a title" do
    article = Article.new(source: "source", title: nil)

    expect(article).not_to be_valid
  end
end
