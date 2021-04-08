defmodule Finger do
  @moduledoc """
  Documentation for `Finger`.
  """

  @assets_path "./assets/"

  @doc """
  Generates a stitched image from the N number of random images.
  Returns {answer, binary_image}
  answer: is the "string" answer to the challenge
  binary_image: is the binary image data to be displayed to the user

  ## Examples

      iex> Finger.generate(4)
      {123, << 12, 34 >>

  """
  def generate(number_of_images = 4) do
    images = fetch_images(number_of_images)
    {construct_answer(images), stitch_images(images)}
  end

  @doc """
  Fetches all the available images from the assets folder, randomly selects N
  """

  def fetch_images(number_of_images) do
    Path.wildcard(@assets_path <> "*.jpg") |> Enum.shuffle() |> Enum.take(number_of_images)
  end

  @doc """
  Constructs the answer from the given image list
  """
  def construct_answer(images) do
    images
    |> Enum.map(&String.replace(&1, @assets_path, ""))
    |> Enum.map(&String.at(&1, 0))
    |> Enum.join()
  end

  @doc """
  Stitches given list of images and returns a binary image data of the result <<1, 2, 3 >>
  """
  defp stitch_images(images) do
    {binary, 0} =
      System.cmd(
        "montage",
        images ++
          [
            "-auto-orient",
            "-geometry",
            "-10-20",
            "-tile",
            "x1",
            "jpg:-"
          ]
      )

    binary
  end
end
