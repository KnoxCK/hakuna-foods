class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :subscription

  def subscription
    @newsletter_subscription = NewsletterSubscription.new
  end
end
