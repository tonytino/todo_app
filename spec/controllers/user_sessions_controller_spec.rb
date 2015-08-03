require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders the new template" do
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe "POST 'create'" do
    context 'with correct credentials' do
      let!(:user) { User.create(first_name: 'Anthony', last_name: 'Hernandez', email: 'anthony@mail.com', password: 'monkey123', password_confirmation: 'monkey123') }

      it 'redirects to the todo list path' do
        post :create, email: 'anthony@mail.com', password: 'monkey123'
        expect(response).to be_redirect
        expect(response).to redirect_to(todo_lists_path)
      end

      it 'finds the user' do
        expect(User).to receive(:find_by).with({ email: 'anthony@mail.com' }).and_return(user)
        post :create, email: 'anthony@mail.com', password: 'monkey123'
      end

      it 'authenticates the user' do
        User.stub(:find_by).and_return(user)
        expect(user).to receive(:authenticate)
        post :create, email: 'anthony@mail.com', password: 'monkey123'
      end

      it 'sets the user_id in the session' do
        post :create, email: 'anthony@mail.com', password: 'monkey123'
        expect(session[:user_id]).to eq(user.id)
      end
    end
  end

end
