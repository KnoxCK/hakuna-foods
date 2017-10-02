class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :mealplans, :ourfood, :order, :about, :orderform, :faqs, :privacy_policy ]

  def home
  end

  def mealplans
    @meal_plans = MealPlan.all.order(:created_at)
  end

  def about
  end

  def ourfood
  end

  def order
  end

  def orderform
    @customer = Customer.new
    @error = params[:error]
  end

  def bespoke
  end

  def faqs
  end

  def privacy_policy
  end
end
