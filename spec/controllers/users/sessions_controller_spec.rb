require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  let(:user) { create(:user) }

  fdescribe 'GET #new' do
    it { expect(get(:new)).to render_template(:new) }
  end
end
