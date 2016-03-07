require 'spec_helper'

describe "Salas" do
  describe "GET /salas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get 'salas/new'
      response.status.should be(200)
    end
  end
end

describe "Salas" do

  describe "Index" do

    it "should have the content 'Agregar hijo'" do
      visit '/salas/new'
      expect(page).to have_content('Agregar hijo')
    end
  end
end