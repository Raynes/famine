defmodule OAuthRouter do
  use Dynamo.Router

  get "/*" do
    Famine.Oauth.authenticate conn
  end
end
