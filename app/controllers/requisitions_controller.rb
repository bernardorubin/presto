class RequisitionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_requisition, only: [:show, :edit, :destroy, :update]
  before_action :authorize, only: [:edit, :destroy, :update]

  def new
    @requisition = Requisition.new
    @locations = ['yes', 'no']
    3.times {@requisition.personal_references.build}
  end

  def create
    @requisition = Requisition.new(requisition_params)
    @requisition.user_id = current_user.id
    if @requisition.save
      flash[:notice] = 'Solicitud Creada Satisfactoriamente'
      redirect_to requisition_path (@requisition)
    else
      flash.now[:alert] = 'Favor de arreglar los problemas abajo'
      3.times {@requisition.personal_references.build}
      render :new
    end
  end

  def show
     # render json:params
  end

  def index
    # aqui use la through association
    @requisitions = current_user.requisitions.latest_first
  end

  def edit
  end

  def update
    if @requisition.update requisition_params
      redirect_to requisition_path(@requisition), notice: 'Solicitud actualizada'
    else
      render :edit
    end
  end

  def destroy
    @requisition.destroy
    redirect_to requisitions_path, notice: 'Solicitud eliminada'
  end

  private

  def authorize
    if cannot?(:read, @requisition) || cannot?(:create, @requisition) || cannot?(:update, @requisition)
      redirect_to requisitions_path, alert: 'No Autorizado a editar cosas de otros usuarios o a eliminar tus solicitudes'
    end
  end

  def requisition_params
    params.require(:requisition).permit(:income, :address_years, :company_years, :marital_status,
                                        :requested_amount, :payment_terms, :bank, :comment, :company_name,
                                        :company_phone_number, :dependents_number, :company_position,
                                        :has_sgmm, :has_imss, :has_car, :user_id, personal_references_attributes: [:first_name, :second_name, :first_last_name, :second_last_name, :cell_phone_number, :id, :requisition_id, :_destroy])
  end

  def find_requisition
    # @requisition = Requisition.find params[:id]
    begin
      @requisition ||= Requisition.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to requisitions_path, alert: "ID Not Found"
    end

  end
end
