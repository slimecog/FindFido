class ReportsController < ApplicationController
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
    @coordinates  = report_coordinates
    @descriptions = report_descriptions
  end

  private
    def report_params
      params.require(:report).permit(:street, :city, :zip, :description)
    end

    def report_coordinates
      Report.all.reduce(Array.new) do |memo, report|
        memo << [report.geocode].flatten
        memo
      end
    end

    def report_descriptions
      Report.all.reduce(Array.new) do |memo, report|
        memo << report.description
        memo
      end
    end
end
