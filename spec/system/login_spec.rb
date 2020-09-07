require 'rails_helper'

describe 'Login', type: :system do
  scenario 'user must login successfully', js: true do
    visit '/admin'

    fill_in 'E-mail', with: 'admin@example.com'
    fill_in 'Senha', with: 'password'

    click_on 'Entrar'

    expect(page).to have_content 'Email ou senha inválidos.'

    create(:admin, email: "admin@example.com")

    fill_in 'E-mail', with: 'admin@example.com'
    fill_in 'Senha', with: 'password'

    click_on 'Entrar'

    expect(page).to have_content 'Logado com sucesso.'
  end
end
