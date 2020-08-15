require 'rails_helper'

RSpec.feature 'USER visits someones profile', type: :feature do
  let(:user1) { FactoryBot.create :user, name: 'user1' }
  let(:user2) { FactoryBot.create :user, name: 'user2', id: 22 }
  # Создаем в базе пару игр
  let!(:games) do
    2.times do |i|
      FactoryBot.create(
        :game_with_questions,
        user: user2,
        created_at: Time.new(2020,07,"#{i + 12}",15,00),
        current_level: i*14,
        prize: i*500000,
      )
    end
  end

  # логинимся как юзер1
  before(:each) do
    login_as user1
  end

  # сценарий на просмотр профиля другого игрока
  scenario 'visit profile' do
    # Заходим на главную
    visit '/'
    # Кликаем по ссылке профиля юзера2
    click_link 'user2'
    #Ожидаем, что попадем на нужный url
    expect(page).to have_current_path "/users/#{user2.id}"
    expect(page).to have_content '500 000 ₽'
    expect(page).to have_content '12 июля, 15:00'
    expect(page).to have_content '13 июля, 15:00'
    expect(page).to have_content 'в процессе'
    # пользователь не видит ссылку на смену пароля.
    expect(page).not_to have_content 'Сменить имя и пароль'
  end
end
