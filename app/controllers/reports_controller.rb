class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    report = Report.new(report_params)
    if report.save
      redirect_to reports_path, success: "Report successfully saved - Thank you!"
    else
      render :new, danger: "Something went wrong - Try again?"
    end
  end

  private

    def report_params
      params.require(:street, :city, :zip, :description)
    end
end
