class PromoCodesController < ApplicationController
  skip_before_action :authenticate_user!
  def verify
    binding.pry
  end
end
