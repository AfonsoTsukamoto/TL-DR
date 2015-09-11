class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    if @upload = Upload.create(upload_params)
      redirect_to summary_path(@upload.summary)
    else
      redirect_to :new, notice: 'OH! Could not summarize this man! Sorry! :('
    end
  end

  def about
  end

  private

  def upload_params
    params.require(:upload).permit(:text)
  end
end
