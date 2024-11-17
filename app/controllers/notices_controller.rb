class NoticesController < ApplicationController
  def index
    @notices = Notice.where(user_id: current_user.id)
  end

  def destroy
  end
end
