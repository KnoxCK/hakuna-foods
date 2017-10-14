class CustomerPlansController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    NewsletterSubscription.create(params[:email])
  end

end
