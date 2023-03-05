defmodule AppboxTest do
  use ExUnit.Case
  doctest Appbox

  test "greets the world" do
    assert Appbox.hello() == :world
  end
end
