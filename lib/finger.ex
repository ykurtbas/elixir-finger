defmodule Finger do
  @moduledoc """
  Documentation for `Finger`.
  """

  # This just feels wrong but Jose said so in the forums. Will search for more answers on the upcoming days
  # TODO: Look for better alternatives
  @assets_path Path.join([File.cwd!(), "assets"]) <> "/"

  @doc """
  Generates a stitched image from the N number of random images.
  Returns {answer, binary_image}
  answer: is the "string" answer to the challenge
  binary_image: is the binary image data to be displayed to the user

  Default number of images is: 4
  Minimum number of images is: 2 (inclusive)
  Maximum number of images is: 9 (inclusive)

  ## Examples

      iex> Finger.generate(4)
      {"123", << 12, 34 >>}

  """
  def generate(number_of_images \\ 4)
      when is_integer(number_of_images) and number_of_images > 1 and number_of_images < 10 do
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

  # Stitches given list of images and returns a binary image data of the result <<1, 2, 3 >>
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
