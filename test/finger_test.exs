defmodule FingerTest do
  use ExUnit.Case
  # doctest Finger

  test "fetches given number of random images from the assets folders" do
    assert length(Finger.fetch_images(1)) == 1
    assert length(Finger.fetch_images(2)) == 2
  end

  test "constructs answer 123 for given set of images" do
    images = ["./assets/1_0.jpg", "./assets/2_1.jpg", "./assets/3_4.jpg"]
    assert Finger.construct_answer(images) == "123"
  end
end
