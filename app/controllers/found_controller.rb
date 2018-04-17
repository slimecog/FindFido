class FoundController < ApplicationController
  def show
    report = Report.find(params[:id])
    report.update found: true
    redirect_to reports_path
  end
end
