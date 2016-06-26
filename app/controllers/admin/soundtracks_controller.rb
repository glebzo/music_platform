class Admin::SoundtracksController < ApplicationController
  before_action :check_is_admin?

  def index
    render template: 'application/home'
  end

  def show
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def check_is_admin?

  end
end
