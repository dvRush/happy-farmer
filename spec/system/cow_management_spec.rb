require "rails_helper"

describe "Cow management", type: :system do
  let(:admin) { create(:admin) }

  before do
    create(:breed, :cow, name: "Nelore")

    sign_in(admin)
    visit "/admin"
  end

  scenario "admin must be able to add a new cow" do
    click_on "Gado"

    click_on "Novo(a) Vaca"

    fill_in "Etiqueta", with: "M31"
    select "Fêmea", from: "Sexo"
    select "Nelore", from: "Raça"
    select "1", from: "cow[birth_date(3i)]"
    select "Janeiro", from: "cow[birth_date(2i)]"
    select "2018", from: "cow[birth_date(1i)]"

    click_on "Criar Vaca"

    expect(page).to have_content "Etiqueta M31"
    expect(page).to have_content "Data de nascimento 01 de Janeiro de 2018"
    expect(page).to have_content "Sexo Fêmea"
    expect(page).to have_content "Raça Nelore"
  end

  context "with existing cows" do
    before do
      create(:breed, :cow, name: "Senepol")

      create(:cow, :male, tag: "Centauro")
    end

    scenario "admin must be able to list it" do
      create(:cow, :female, tag: "Estrela")

      click_on "Gado"

      expect(page).to have_content "Centauro"
      expect(page).to have_content "Estrela"
    end

    scenario "admin must be able to delete it" do
      click_on "Gado"

      expect(page).to have_content "Centauro"

      click_on "Remover"

      expect(page).not_to have_content "Centauro"
      expect(page).to have_content "Não existem Gado ainda."
    end

    scenario "admin must be able to edit it" do
      click_on "Gado"

      expect(page).to have_content "Centauro"

      click_on "Editar"

      fill_in "Etiqueta", with: "Touro Buh"
      select "Macho", from: "Sexo"
      select "Senepol", from: "Raça"
      select "2", from: "cow[birth_date(3i)]"
      select "Fevereiro", from: "cow[birth_date(2i)]"
      select "2019", from: "cow[birth_date(1i)]"

      click_on "Atualizar Vaca"

      expect(page).to have_content "Touro Buh"
      expect(page).to have_content "Data de nascimento 02 de Fevereiro de 2019"
      expect(page).to have_content "Sexo Macho"
      expect(page).to have_content "Raça Senepol"
    end
  end
end
