class ConsultationsPolicy < ApplicationPolicy
  def new?
    user.present?
  end
end
