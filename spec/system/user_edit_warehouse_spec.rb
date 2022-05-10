require 'rails_helper'

describe 'Usuário editando um galpão' do
  it 'a partir da página de detalhes' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Rio', code: 'RIO',address:'Av. Atlantica 100', 
                                 cep: '20000-000', city: 'Rio de Janeiro', area: 40000,
                                 description: 'Galpão do Aeroporto do Galeão')
    # Act
    visit root_path
    click_on 'Rio'
    click_on 'Editar'

    # Assert
    expect(page).to have_content 'Editar Galpão'
    expect(page).to have_field('Nome', with: 'Rio')
    expect(page).to have_field('Código', with: 'RIO')
    expect(page).to have_field('Endereço', with: 'Av. Atlantica 100')
    expect(page).to have_field('Cidade', with: 'Rio de Janeiro')
    expect(page).to have_field('CEP', with: '20000-000')
    expect(page).to have_field('Área', with: '40000')
    expect(page).to have_field('Descrição', with: 'Galpão do Aeroporto do Galeão')

  end

  it 'com sucesso' do
    warehouse = Warehouse.create!(name: 'Rio', code: 'RIO',address:'Av. Atlantica 100', 
                                 cep: '20000-000', city: 'Rio de Janeiro', area: 40000,
                                 description: 'Galpão do Aeroporto do Galeão')
    # Act
    visit root_path
    click_on 'Rio'
    click_on 'Editar'

    fill_in 'Nome', with: 'Galpão Internacional'
    fill_in 'Área', with: '60000'
    fill_in 'Código', with: 'GIG'
    click_on 'Atualizar Galpão'

    # Assert
    expect(page).to have_content 'Galpão atualizado com sucesso'
    expect(page).to have_content 'Nome: Galpão Internacional'
    expect(page).to have_content 'Endereço: Av. Atlantica 100'
    expect(page).to have_content 'Cidade: Rio de Janeiro'
    expect(page).to have_content 'CEP: 20000-000'
    expect(page).to have_content 'Área: 60000'

  end

  it 'e mantém os campos obrigatórios' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Rio', code: 'RIO',address:'Av. Atlantica 100', 
                                  cep: '20000-000', city: 'Rio de Janeiro', area: 40000,
                                  description: 'Galpão do Aeroporto do Galeão')

    # Act
    visit root_path
    click_on 'Rio'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Área', with: ''
    fill_in 'Código', with: ''
    click_on 'Atualizar Galpão'

    # Assert
    expect(page).to have_content 'Não foi possível atualizar o galpão'

  end
end