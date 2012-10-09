class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all(sort: [[:date, :asc]])

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
    @attendance = Attendance.new

    now = Time.now
    @attendance.in = Time.local(now.year, now.month, now.day, 9)
    @attendance.out = Time.local(now.year, now.month, now.day, 17, 30)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(params[:attendance])

    # Change date of in and out.
    @attendance.in = Time.local(
      @attendance.date.year, @attendance.date.month, @attendance.date.day,
      @attendance.in.hour, @attendance.in.min, @attendance.in.sec)
    @attendance.out = Time.local(
      @attendance.date.year, @attendance.date.month, @attendance.date.day,
      @attendance.out.hour, @attendance.out.min, @attendance.out.sec)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to :action => 'index' }
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to :action => 'index' }
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
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.json { head :no_content }
    end
  end
end
