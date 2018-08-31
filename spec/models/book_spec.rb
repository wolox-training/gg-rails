require 'rails_helper'

describe Book do
  subject(:book) { build(:book) }

  it do
    should validate_presence_of(:genre)
  end

  it do
    should validate_presence_of(:author)
  end

  it do
    should validate_presence_of(:image)
  end

  it do
    should validate_presence_of(:title)
  end

  it do
    should validate_presence_of(:publisher)
  end

  it do
    should validate_presence_of(:year)
  end
end
