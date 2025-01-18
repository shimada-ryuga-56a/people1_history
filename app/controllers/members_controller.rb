class MembersController < ApplicationController
  def index
    @members = Member.all.order(:id)
  end

  def show
  end

  def image
    @member = Member.find(params[:id])
  end
end
