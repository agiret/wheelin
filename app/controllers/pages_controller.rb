class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @wheelies = policy_scope(Wheely).order(created_at: :desc)
  end
end
