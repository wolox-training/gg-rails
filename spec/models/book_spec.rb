require 'rails_helper'

describe Book do
  subject(:book) { build(:book) }

  it { should validate_presence_of(:genre) }

  it { should validate_presence_of(:author) }

  it { should validate_presence_of(:image) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:publisher) }

  it { should validate_presence_of(:year) }
end
