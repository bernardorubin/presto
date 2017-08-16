class RequisitionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_requisition, only: [:show, :edit, :destroy, :update]
  before_action :authorize, only: [:edit]

  def new
    @requisition = Requisition.new
    @locations = ['yes', 'no']
    # 3.times {@requisition.personal_references.build}
    @requisition.personal_references.build
  end

  def create
    @requisition = Requisition.new(requisition_params)
    @requisition.user_id = current_user.id
    if @requisition.save
      flash[:notice] = 'Solicitud Creada Satisfactoriamente'
      redirect_to requisition_path (@requisition)
    else
      flash.now[:alert] = 'Favor de arreglar los problemas abajo'
      @requisition.personal_references.build
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
    if cannot?(:update, @requisition)
      redirect_to requisitions_path, alert: 'No Autorizado a editar solicitudes que no son tuyas'
    else
      if @requisition.update requisition_params
        redirect_to requisition_path(@requisition), notice: 'Solicitud actualizada'
      else
        render :edit
      end
    end
  end

  def destroy
    if cannot?(:destroy, @requisition)
      redirect_to requisitions_path, alert: 'No Autorizado a eliminar tus solicitudes'
    else
      @requisition.destroy
      redirect_to requisitions_path, notice: 'Solicitud eliminada'
    end
  end

  private

  def authorize
    if cannot?(:read, @requisition)
      redirect_to requisitions_path, alert: 'No Autorizado a leer solicitudes que no son tuyas'
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
