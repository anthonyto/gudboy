def retrieve_token(user)
  post "/auth", { email: user.email, password: user.password }
  JSON.parse(response.body)["auth_token"]
end