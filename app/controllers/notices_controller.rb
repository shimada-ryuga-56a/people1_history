class NoticesController < ApplicationController
  def index
    @notices = Notice.where(user_id: current_user.id).includes(noticeable: :user).order(created_at: :desc)
  end

  def destroy
  end
end
