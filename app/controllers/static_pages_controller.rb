class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[top contact]
  def top
  end

  def contact
  end

  def in_progress
  end
end
