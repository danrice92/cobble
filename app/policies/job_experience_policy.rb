class JobExperiencePolicy < ApplicationPolicy
  attr_reader :user, :job_experience

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit?
    @record.creator == @user
  end

  def update?
    edit?
  end
end
