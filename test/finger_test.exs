defmodule FingerTest do
  use ExUnit.Case
  # doctest Finger

  test "fetches given number of random images from the assets folders" do
    assert length(Finger.fetch_images(1)) == 1
    assert length(Finger.fetch_images(2)) == 2
  end

  test "constructs answer 123 for given set of images" do
    path = Path.join([File.cwd!(), "assets"]) <> "/"
    images = [path <> "1_0.jpg", path <> "2_1.jpg", path <> "3_4.jpg"]
    assert Finger.construct_answer(images) == "123"
  end

  test "generation raises exceptions for invalid ranges" do
    assert_raise FunctionClauseError, "no function clause matching in Finger.generate/1", fn ->
      Finger.generate(0)
    end

    assert_raise FunctionClauseError, "no function clause matching in Finger.generate/1", fn ->
      Finger.generate(10)
    end
  end

  test "generates N length answers for N" do
    for N <- 2..9 do
      {answer, _} = Finger.generate(N)
      assert length(answer) == N
    end
  end
end
