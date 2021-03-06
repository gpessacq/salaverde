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

 test "should update sala" do
   for locale in @locales do
     patch :update, :id => @sala.id, locale: "#{locale}", params: { sala: {
                                         nombre: @sala.nombre,
                                         apellido: @sala.apellido, cumple: @sala.cumple,
                                         email: @sala.email, fecha_festejo: @sala.fecha_festejo,
                                         lugar_festejo: @sala.lugar_festejo } }
      assert_redirected_to sala_url(@sala)
    end
  end
  test "should create sala" do
    for locale in @locales do
      assert_difference('Sala.count') do
        post :create, locale: "#{locale}", params: { sala: {
                                           nombre: @sala.nombre,
                                           apellido: @sala.apellido, cumple: @sala.cumple,
                                           email: @sala.email, fecha_festejo: @sala.fecha_festejo,
                                           lugar_festejo: @sala.lugar_festejo } }
        end
      assert_redirected_to sala_url(sala.last)
    end
  end

  test "should destroy sala" do
    for locale in @locales do
      assert_difference('Sala.count', -1) do
        delete :destroy, :id => @sala.id, locale: "#{locale}"
      end
      assert_redirected_to salas_url
    end
  end
end
