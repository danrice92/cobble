
class ConsultationsController < ApplicationController
  def new
    authorize :consultations
  end
end
