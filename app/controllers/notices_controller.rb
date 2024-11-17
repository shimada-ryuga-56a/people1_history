class NoticesController < ApplicationController
  def index
    @notices = Notice.where(user_id: current_user.id, unread: true).includes(noticeable: :user).order(created_at: :desc)
  end

  def destroy
    @notices = Notice.where(user_id: current_user.id, unread: true).includes(noticeable: :user).order(created_at: :desc)
    @notices.update_to_read
    redirect_to notices_path
  end

  private

  def update_to_read
    self.each do |notice|
      notice.unread = false
      notice.save
    end
  end
end
