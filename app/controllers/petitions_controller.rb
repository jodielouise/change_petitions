class PetitionsController < ApplicationController
  before_action :find_petition, only: [:show, :edit, :update, :destroy]

  def index
    @petitions = Petition.all.order("created_at DESC")
  end

  def show
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)

    if @petition.save
      redirect_to @petition, notice: "Successfully created new Petition"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @petition.update(petition_params)
      redirect_to @petition, notice: "Petition was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @petition.destroy
      redirect_to root_path
  end

  private
  def petition_params
		params.require(:petition).permit(:title, :description)
	end

  def find_petition
    @petition = Petition.find(params[:id])
  end

end
