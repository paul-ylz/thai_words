class EntriesController < ApplicationController
  respond_to :json

  def create
    respond_with Entry.create(permitted_params)
  end

  def destroy
    respond_with Entry.destroy(params[:id])
  end

  private

    def permitted_params
      params.require(:entry).permit :english, :thai
    end
end
