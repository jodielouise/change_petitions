class PetitionsController < ApplicationController
  before_action :find_petition, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def search
    if params[:search].present?
      @petitions = Petition.search(params[:search])
    else
      @petitions = Petition.all
    end
  end

  def index
    if params[:catagory].blank?
      @petitions = Petition.all.order("created_at DESC")
    else
      @catagory_id = Catagory.find_by(name: params[:catagory]).id
      @petitions = Petition.where(Catagory_id: @catagory_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @petition = current_user.petitions.build
  end

  def create
    @petition = current_user.petitions.build(petition_params)

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
		params.require(:petition).permit(:title, :description, :image, :catagory_id)
	end

  def find_petition
    @petition = Petition.find(params[:id])
  end

end
