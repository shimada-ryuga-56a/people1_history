class MembersController < ApplicationController
  def index
    @members = Member.eager_load(:instruments).order(:id)
  end

  def show
  end

  def image
    @member = Member.find(params[:id])
  end
end
