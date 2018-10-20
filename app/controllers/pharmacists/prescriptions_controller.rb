class Pharmacists::PrescriptionsController < ApplicationController
  def new
    @prescription = Prescription.new
  end

  def create
    puts "On arrive dans le create des ordonnances"
  end

  def edit
  end

  def update
  end
end