require 'test_helper'

class SalaTest < ActiveSupport::TestCase
  sala = Sala.new

#  assert sala.invalid?
  assert sala.errors[:nombre].any?
  assert sala.errors[:apellido].any?
  assert sala.errors[:cumple].any?
  assert sala.errors[:email].any?

   test "the truth" do
    assert true
   end
end
