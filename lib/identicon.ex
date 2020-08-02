defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  def main(input) do
    input
      |> hash_input
        |> pick_color
          |> build_grid
            |> filter_odd_squares
  end

  def pick_color(%Identicon.Image{ hex: [r, g, b | _tail] } = image) do
    # Take image as an input
    # %Identicon.Image{hex: hex_list} = image
    # [r, g, b | _tail] = hex_list
    Identicon.Image.update_with_color(r, g, b, image)
  end

  def hash_input(input) do
    :crypto.hash(:md5, input)
      |> :binary.bin_to_list
        |> Identicon.Image.construct  
  end

  def build_grid(%Identicon.Image{ hex: hex_list } = image) do
    hex_list
      |> Enum.chunk_every(3, 3, :discard)
        |> Enum.map(&mirror_row/1)
          |> List.flatten
            |> Enum.with_index
              |> Identicon.Image.update_with_grid(image)
  end

  def mirror_row([first, second | _tail] = row) do
    row ++ [second, first] 
  end

  def filter_odd_squares(%Identicon.Image{ grid: grid} = image) do
    Enum.filter(grid, 
      fn({code, _index}) -> 
        rem(code, 2) == 0
      end)
  end

end
