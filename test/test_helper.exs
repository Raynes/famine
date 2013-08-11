Dynamo.under_test(Famine.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Famine.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
