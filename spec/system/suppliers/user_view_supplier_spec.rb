require 'rails_helper'

describe 'Usuario visita tela de Fornecedores' do
  it 'e vê header Lista de Fornecedores' do
    # Arrange 
    # Act
    visit(root_path)
    within('nav') do
      click_on 'Fornecedores'
    end
  
    # Assert
    expect(page).to have_content('Lista de Fornecedores')
    expect(current_path).to eq suppliers_path
  end

  it 'e vẽ os fornecedores cadastrados' do
    # Arrange
    Supplier.create!(corporate_name: 'XPTO S/A', brand_name: 'XPTO', 
                                registration_number: '18082693000174', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br', phone: '11-555-5555')

    Supplier.create!(corporate_name: 'ACME S/A', brand_name: 'ACME',
                                   registration_number: '42298046000184', 
                                   full_address: 'Av Brasil, 200', city: 'Recife', state: 'PE', 
                                   email: 'contato@acme.com.br', phone: '81-333-3333')
    # Act
    visit(root_path)
    click_on 'Fornecedores'

    # Assert
    expect(page).not_to have_content('Não existem fornecedores cadastrados')
    expect(page).to have_content('Nome')
    expect(page).to have_content('Localização')
    expect(page).to have_content('XPTO')
    expect(page).to have_content('São Paulo - SP')
    expect(page).to have_content('ACME')
    expect(page).to have_content('Recife - PE')
  
  end

  it 'e não existem fornecedores cadastrados' do
    # Arrange
    # Act
    visit(root_path)
    click_on 'Fornecedores'
    # Assert
    expect(page).to have_content('Não existem fornecedores cadastrados')
  end
end