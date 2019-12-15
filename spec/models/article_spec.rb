require 'rails_helper'

RSpec.describe Article, type: :model do
  subject(:article) { create(:article) }

  it 'defines the risk enum correctly' do
    expect(article).to(define_enum_for(:risk)
      .with_values(negligible: 'negligible', low: 'low', medium: 'medium', high: 'high')
      .with_suffix
      .backed_by_column_of_type(:enum))
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
