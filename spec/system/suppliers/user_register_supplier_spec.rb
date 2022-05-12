require 'rails_helper'

describe 'Usuário cadastra um Fornecedor' do
  it 'a partir da tela de inicial' do
    # Arrange
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'

    # Assert
    expect(page).to have_content('Novo Fornecedor')
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('Nome Fantasia')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('E-mail')
    expect(page).to have_field('Telefone')
  end

  it 'com sucesso' do
    # Arrange
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'
    fill_in 'Razão Social', with: 'XPTO S/A'
    fill_in 'Nome Fantasia', with: 'XPTO'
    fill_in 'CNPJ', with: '18082693000174'
    fill_in 'Endereço', with: 'Av Interlagos, 1000'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Estado', with: 'SP'
    fill_in 'E-mail', with: 'contato@xpto.com.br'
    fill_in 'Telefone', with: '11-555-5555'
    click_on 'Criar Fornecedor'

    # Assert
    expect(page).to have_content 'Fornecedor cadastrado com sucesso'
    expect(page).to have_content 'XPTO S/A'
    expect(page).to have_content 'XPTO'
    expect(page).to have_content '18082693000174'
    expect(page).to have_content 'Av Interlagos, 1000'
    expect(page).to have_content 'São Paulo'
    expect(page).to have_content 'SP'
    expect(page).to have_content 'contato@xpto.com.br'
    expect(page).to have_content '11-555-5555'
    expect(current_path).to eq suppliers_path
  end

  it 'com dados incompletos' do
    # Arrange
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'
    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Criar Fornecedor'

    expect(page).to have_content 'Fornecedor não cadastrado'
    expect(page).to have_content 'Razão Social não pode ficar em branco'
    expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
  end

end