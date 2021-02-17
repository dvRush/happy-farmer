require "rails_helper"

describe Insemination, type: :system do
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
    visit "/admin"
  end

  context "cow" do
    let!(:cow_01) { create(:cow, tag: "C-01") }

    scenario "registers a new insemination" do
      click_on "Gado"

      expect(page).to have_content "C-01"

      click_on "Visualizar"

      fill_in "Inseminado em", with: "01/01/2021"
      click_on "Criar Inseminação"

      expect(page).to have_content "1 de Janeiro de 2021, 00:00"
      expect(page).to have_content "Vaca C-01"
    end
  end
end
