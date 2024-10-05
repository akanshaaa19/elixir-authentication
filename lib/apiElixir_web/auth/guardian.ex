defmodule ApiElixirWeb.Auth.Guardian do
  use Guardian, otp_app: :apiElixir
  alias ApiElixir.Accounts

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :no_id}
  end

  def resource_from_claims(%{"sub"=>id}) do
    case Accounts.get_account!(id) do
      nil -> {:error, :no_account}
      account -> {:ok, account}
    end
  end

  def resource_from_claims(_) do
    {:error, :no_id}
  end

  def authenticate(email, password) do
    case Accounts.get_account_by_email(email) do
      nil -> {:error, :unauthorised}
      account ->
        case validate_pasword(password, account.hashed_password) do
          true -> {:ok, create_token(account)}
          false -> {:error, :unauthorised}
        end
    end
  end

  defp validate_pasword(password, hashed_password) do
    Bcrypt.verify_pass(password, hashed_password)
  end

  defp create_token(account) do
    {:ok, token, _claims}  = encode_and_sign(account)
    {:ok, account, token}
  end
end
