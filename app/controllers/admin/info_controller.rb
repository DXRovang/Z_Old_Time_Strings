class Admin::InfoController < ActionController::Base
  def index
    @instruments = Instrument.all.count
    @users = User.all.count
  end
end