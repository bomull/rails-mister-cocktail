class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: @cocktail)
    @dose = Dose.new()
  end

  def new
    @dose = Dose.new()
    # @cocktail = Cocktail.find(params[:id])
    @cocktail = Cocktail.new()

  end

  def create
    cocktail = Cocktail.create(cocktail_params)
    redirect_to cocktail_path(cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
