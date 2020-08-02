defmodule Identicon.Image do
    defstruct hex: nil

    def construct_image(hex_list) do
        %Identicon.Image{hex: hex_list}
    end
end
