class PromoCodesController < ApplicationController
  skip_before_action :authenticate_user!

  def verify
    PromoCode.verify(params[:customer_plan_id], params[:code])
    @customer_plan = CustomerPlan.find(params[:customer_plan_id])
    @message = @customer_plan.promo_verified? ? "Verified" : "Code invalid"
  end
end
