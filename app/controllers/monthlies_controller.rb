class MonthliesController < ApplicationController
  # POST /monthlies
  # POST /monthlies.json
  def create
    @monthly = Monthly.new(params[:monthly])
    respond_to do |format|
      if @monthly.save
        format.html { redirect_to :controller => 'attendances', :action => 'index' }
        format.json { render json: @monthly, status: :created, location: @monthly }
      else
        format.html { redirect_to :controller => 'attendances', :action => 'index' }
        format.json { render json: @monthly.errors, status: :unprocessable_entity }
      end
    end
  end
end
