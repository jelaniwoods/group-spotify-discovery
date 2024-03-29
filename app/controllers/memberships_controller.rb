class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[ show edit update destroy ]

  # GET /memberships
  def index
    @memberships = Membership.all
  end

  # GET /memberships/1
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  def create
    user = User.find_by(username: params[:username])
    create_params = membership_params
    if user.present?
      create_params = membership_params.merge({user_id: user.id})
    end
    @membership = Membership.new(create_params)

    if @membership.save
      redirect_to @membership, notice: "Membership was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /memberships/1
  def update
    if @membership.update(membership_params)
      redirect_to @membership, notice: "Membership was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /memberships/1
  def destroy
    @membership.destroy
    redirect_to memberships_url, notice: "Membership was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def membership_params
      params.require(:membership).permit(:group_id)
    end
end
