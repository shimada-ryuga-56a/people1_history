class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[top contact]
  def top
    flash[:success] = I18n.t('flash.success.post')
  end

  def contact
  end

  def in_progress
  end
end
