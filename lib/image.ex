defmodule Identicon.Image do
    defstruct hex: nil, color: nil, grid: nil, pixel_map: nil

    def construct(hex_list) do
        %Identicon.Image{hex: hex_list}
    end

    def update_with_color(r, g, b, image) do
        %Identicon.Image{image | color: {r, g, b}}
    end

    def update_with_grid(grid, image) do
        %Identicon.Image{image | grid: grid}
    end

    def update_with_pixel_map(pixel_map, image) do
        %Identicon.Image{image | pixel_map: pixel_map}
    end

end
