class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.json
  def index
    @monthlies = Monthly.all.asc
    now = Time.now
    @new_monthly = Monthly.new
    @new_monthly.year = now.year
    @new_monthly.month = now.month
    @year_collection = [now.year - 1, now.year ,now.year + 1]

    if params[:monthly_id]
      @monthly = Monthly.find(params[:monthly_id])
    else
      @monthly = Monthly.where(:year => now.year, :month => now.month).first
      unless @monthly
        @monthly = @monthlies[-1]
        #TODO View new monthly if no monthly record.
      end
    end
    flash[:monthly] = @monthly
    @attendances = @monthly.attendances
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @monthly = flash[:monthly]
    flash[:monthly] = @monthly

    now = Time.now
    @attendance = Attendance.new
    @attendance.in = Time.local(@monthly.year, @monthly.month, now.day, 9)
    @attendance.out = Time.local(@monthly.year, @monthly.month, now.day, 17, 30)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @monthly = flash[:monthly]
    @attendance = @monthly.attendances.find(params[:id])
    flash[:monthly] = @monthly
  end

  # POST /attendances
  # POST /attendances.json
  def create
    monthly = flash[:monthly]
    @attendance = Attendance.new(params[:attendance])
    @attendance.date = Date.new(monthly.year, monthly.month, params[:day_of_date].to_i)

    # Change date of in and out.
    @attendance.in = Time.local(
      @attendance.date.year, @attendance.date.month, @attendance.date.day,
      @attendance.in.hour, @attendance.in.min, @attendance.in.sec)
    @attendance.out = Time.local(
      @attendance.date.year, @attendance.date.month, @attendance.date.day,
      @attendance.out.hour, @attendance.out.min, @attendance.out.sec)

    respond_to do |format|
      if monthly.attendances.push @attendance
        format.html { redirect_to :action => 'index', :monthly_id => monthly.id }
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        @monthly = monthly
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    monthly = flash[:monthly]
    @attendance = monthly.attendances.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to :action => 'index', :monthly_id => monthly.id }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    monthly = flash[:monthly]
    attendance = monthly.attendances.find(params[:id])
    attendance.destroy
    respond_to do |format|
      format.html { redirect_to :action => 'index', :monthly_id => monthly.id }
      format.json { head :no_content }
    end
  end
end
