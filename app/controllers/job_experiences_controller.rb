class JobExperiencesController < ApplicationController
  def new
    render react_component: "NewJobExperience"
  end
end
