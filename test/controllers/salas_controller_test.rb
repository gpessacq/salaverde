require 'test_helper'

class SalasControllerTest < ActionController::TestCase

  def setup
    @locales = ["es", "en"]
    @sala = salas(:one)
  end

  test "should get index" do
    for locale in @locales do
      get :index, locale: "#{locale}"
      assert_response :success
    end
  end

  test "should get new" do
    for locale in @locales do
      get :new, locale: "#{locale}"
      assert_response :success
    end
  end

  test "should show sala" do
    for locale in @locales do
      get :show, :id => @sala.id, locale: "#{locale}"
      assert_response :success
    end
  end

  test "should get edit" do
    for locale in @locales do
      get :edit, :id => @sala.id, locale: "#{locale}"
      assert_response :success
    end
  end
end
