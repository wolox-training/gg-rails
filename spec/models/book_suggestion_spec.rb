require 'rails_helper'

describe BookSuggestion do
  subject(:book_suggestion) { build(:book_suggestion) }

  it { should validate_presence_of(:author) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:link) }
end
