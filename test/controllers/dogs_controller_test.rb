require "test_helper"

class DogsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/dogs.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Dog.count, data.length
  end

  test "show" do
    get "/dogs/#{Dog.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "age", "breed", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Dog.count", 1 do
      post "/dogs.json", params: { name: "test", age: 10, breed: "test breed" }
      assert_response 200
    end

    post "/dogs.json", params: {}
    assert_response 422
  end

  test "update" do
    dog = Dog.first
    patch "/dogs/#{dog.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal dog.age.to_s, data["age"]
    assert_equal dog.breed, data["breed"]

    patch "/dogs/#{dog.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Dog.count", -1 do
      delete "/dogs/#{Dog.first.id}.json"
      assert_response 200
    end
  end
end
