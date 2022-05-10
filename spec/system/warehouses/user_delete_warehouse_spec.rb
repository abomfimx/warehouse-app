require 'rails_helper'

describe 'Usuário remove um galpão' do
  it 'com sucesso' do
    # Arragne
    warehouse = Warehouse.create!(name: 'Rio', code: 'RIO',address:'Av. Atlantica 100', 
                                  cep: '20000-000', city: 'Rio de Janeiro', area: 40000,
                                  description: 'Galpão do Aeroporto do Galeão')

    # Act
    visit root_path
    click_on 'Rio'
    click_on 'Remover'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).not_to have_content 'Rio'
    expect(page).not_to have_content 'RIO'
  end

  it 'e não apaga outros galpões' do
    # Arrange
    first_warehouse = Warehouse.create!(name: 'Rio', code: 'RIO',address:'Av. Atlantica 100', 
                                        cep: '20000-000', city: 'Rio de Janeiro', area: 40000,
                                        description: 'Galpão do Aeroporto do Galeão')

    second_warehouse = Warehouse.create!(name: 'Curitiba', code: 'CRB',address:'Av. Central 500', 
                                        cep: '50000-000', city: 'Curitiba', area: 45000,
                                        description: 'Galpão do Aeroporto de Curitiba')

    # Act
    visit root_path
    click_on 'Rio'
    click_on 'Remover'

    # Assert
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).to have_content 'Curitiba'
    expect(page).not_to have_content 'Rio'

  end
end