module UsersHelper
  def get_error_message(sym, resource)
    resource.errors[sym].first
  end
end
