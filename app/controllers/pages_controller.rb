class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :mealplans, :ourfood, :order, :about, :orderform ]

  def home
  end

  def mealplans
    @meal_plans = MealPlan.all
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
end
