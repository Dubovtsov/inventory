class AttachmentsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    # @file = current_user.files.find(params[:id])
    @file = ActiveStorage::Attachment.find(params[:id])
    if @file.destroy
      respond_to do |format|
        # format.html { redirect_to :back, notice: 'File was successfully destroyed.' }
        # format.json { head :no_content }
        format.turbo_stream { turbo_stream.remove(@file) }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, alert: 'File could not be destroyed.' }
        format.json { render json: @file.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @file = ActiveStorage::Attachment.find(params[:id])
  #   @file.purge
  # end
end
