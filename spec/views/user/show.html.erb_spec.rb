require 'rails_helper'

RSpec.describe 'users/show', type: :view do

  context 'for any user' do
    before(:each) do
      assign(:user, FactoryBot.build_stubbed(:user, name: 'Тестович'))
      stub_template 'users/_game.html.erb' => 'User game goes here'
      render
    end

    # пользователь видит там свое имя
    it 'renders player name' do
      expect(rendered).to match 'Тестович'
    end

    it 'shouldnt render edit button' do
      expect(rendered).not_to match 'Сменить имя и пароль'
    end

    # на странице отрисовываются фрагменты с игрой
    it 'renders game' do
      render partial: 'users/game'
      expect(rendered).to match 'User game goes here'
    end
  end

  # текущий пользователь (и только он) видит кнопку для смены пароля
  context "for current user" do
    let(:user) { FactoryBot.build_stubbed(:user) }
    let(:current_user) { assign(:user, user) }
    before do
      allow(view).to receive(:current_user).and_return(current_user)
      render
    end

    it 'should render edit button' do
      expect(rendered).to match 'Сменить имя и пароль'
    end
  end
end
