class ReportsController < ApplicationController
  before_action :require_user
  
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to reports_path, success: "Report successfully saved - Thank you!"
    else
      flash[:danger] = "Something went wrong - Try again?"
      render :new
    end
  end

  def index
    @reports = Report.all
  end

  private
    def report_params
      params.require(:report).permit(:street, :city, :zip, :description)
    end
end
