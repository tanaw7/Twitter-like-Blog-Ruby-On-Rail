class FellowshipsController < ApplicationController
  def create
    @fellowship = current_user.fellowships.new(:fellow_id => params[:fellow_id])
    if @fellowship.save
      flash[:notice] = "Added fellow."
      redirect_to '/showfellows'
    else
      flash[:error] = "Error occured when adding fellow."
      redirect_to '/showfellows'
    end
  end

  def creategg
    @fellowship = current_user.fellowships.new(:fellow_id => params[:fellow_id])
    if @fellowship.save
      flash[:notice] = "Added fellow."
      redirect_to '/newfellows'
    else
      flash[:error] = "Error occured when adding fellow."
      redirect_to '/newfellows'
    end
  end
  
  def destroy
    @fellowship = current_user.fellowships.find(params[:id])
    @fellowship.destroy
    flash[:notice] = "Successfully destroyed fellowship."
    redirect_to '/showfellows'
  end
end
