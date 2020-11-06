class DosesController < ApplicationController
  before_action :set_cocktail, except: %i[destroy] 
  
  # get /cocktails/:cocktails_id
  def new 
    @dose = Dose.new
  end 
  
  # post /cocktails/:cocktail_id/doses
  def create
    @dose = Dose.new(dose_params) 
    @dose.cocktail = @cocktail
      
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end 

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail), alert: "Ingredient Deleted!"
  end

private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])  
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
