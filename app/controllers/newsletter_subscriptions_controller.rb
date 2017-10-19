class NewsletterSubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    NewsletterSubscription.create(newsletter_params)
    redirect_to root_path
  end

  private

  def newsletter_params
    params.require(:newsletter_subscription).permit(:email)
  end
end
