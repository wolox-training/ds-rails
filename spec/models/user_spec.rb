require 'rails_helper'

describe Book do
  subject(:book) { build(:book) }

  %i[genre author image title publisher year].each do |field|
    it { is_expected.to validate_presence_of(field) }
  end
end
