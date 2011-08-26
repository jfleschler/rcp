class StepsController < ApplicationController
  def show
  	@step = Step.find(params[:id])
  end

end
