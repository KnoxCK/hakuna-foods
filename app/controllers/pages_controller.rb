class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :mealplans, :ourfood, :order, :about ]

  def home
  end

  def mealplans
  end

  def ourfood
  end

  def order
  end

  def about
  end
end
