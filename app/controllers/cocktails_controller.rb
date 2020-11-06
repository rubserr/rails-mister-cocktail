class CocktailsController < ApplicationController
  
  def index
    @cocktails = Cocktail.all.order(name: :asc) 
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end
  
  def new
    @cocktail = Cocktail.new
  end
  
  def create
    @cocktail = Cocktail.new(cocktail_params)
   
    if @cocktail.save 
      redirect_to cocktail_path(@cocktail), notice: "Cocktail <strong>#{@cocktail.name}</strong> was created successfully!"
    else
      render :new
    end
  end
 
private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
 end
