class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[top contact in_progress privacy_policy terms_of_service]
  def top
  end

  def contact
  end

  def in_progress
  end

  def privacy_policy
  end

  def terms_of_service
  end
end
