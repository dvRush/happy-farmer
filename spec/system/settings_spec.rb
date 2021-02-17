require "rails_helper"

describe "Settings", type: :system do
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
    visit "/admin"
  end

  context "breed" do
    let(:select_breed_from_menu) do
      Proc.new {
        click_on "Configurações"
        click_on "Gerenciar raças"
      }
    end

    scenario "admin must be able to CRUD a breed" do
      select_breed_from_menu.call
      click_on "Novo(a) Raça"

      select "Vaca", from: "Tipo de animal"
      fill_in "Nome", with: "Sindi"

      click_on "Criar Raça"

      expect(page).to have_content "Sindi"
      expect(page).to have_content "Vaca"

      select_breed_from_menu.call

      expect(page).to have_content "Sindi"
      expect(page).to have_content "Vaca"

      click_on "Editar"

      fill_in "Nome", with: "Guzerá"

      click_on "Atualizar Raça"

      expect(page).to_not have_content "Sindi"
      expect(page).to have_content "Guzerá"

      select_breed_from_menu.call

      click_on "Remover"

      page.accept_alert

      expect(page).to_not have_content "Guzerá"
    end
  end
end
