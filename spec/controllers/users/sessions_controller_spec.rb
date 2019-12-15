require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it { expect(get(:new)).to render_template(:new) }
  end

  describe 'POST #create' do
    context 'with valid details' do
      before do
        post :create, params: { user: { email: user.email, password: user.password } }
      end

      it 'redirects the user to the root path' do
        expect(response).to redirect_to(root_path)
      end

      it 'sets the users authentication token' do
        expect(user.reload.authentication_token).not_to be_nil
      end
    end

    context 'with invalid details' do
      before do
        post :create, params: { user: { email: 'invalid', password: 'password' } }
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'sets the appropriate error message' do
        error_string = I18n.t('users.sessions.fail')

        expect(assigns(:user).errors['base'].first).to eq(error_string)
      end

      it 'doesnt generate the user an authentication token' do
        expect(user.reload.authentication_token).to be_nil
      end
    end
  end

  describe 'delete #destroy' do
    context 'when successful' do
      before do
        user.ensure_authentication_token!

        delete :destroy, session: { user_id: user.id,
                                    authentication_token: user.authentication_token }
      end

      it 'redirects to the root path' do
        expect(response).to redirect_to(root_path)
      end

      it 'nullifies the users authentication token' do
        expect(user.reload.authentication_token).to be_nil
      end

      it 'removes user_id from the users session' do
        expect(session[:user_id]).to be_nil
      end

      it 'removes authentication_token from the users session' do
        expect(session[:authentication_token]).to be_nil
      end
    end

    it 'does not error when user is not logged in' do
      delete :destroy

      expect(response).to redirect_to(root_path)
    end
  end
end
