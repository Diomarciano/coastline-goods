class KonfirmsController < ApplicationController
  before_action :set_konfirm, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!


  # GET /konfirms
  # GET /konfirms.json
  def index
    @konfirms = Konfirm.all
  end

  # GET /konfirms/1
  # GET /konfirms/1.json
  def show
  end

  # GET /konfirms/new
  def new
    @konfirm = Konfirm.new
  end

  # GET /konfirms/1/edit
  def edit
  end

  # POST /konfirms
  # POST /konfirms.json
  def create
    @konfirm = Konfirm.new(konfirm_params)
    @konfirm.user_id = current_user.id


    respond_to do |format|
      if @konfirm.save
      UserMailer.konfirm_mail(@konfirm, @user).deliver_now

        format.html { redirect_to root_path, notice: 'Terimakasih Telah Melakukan Pembayaran.' }
        format.json { render :show, status: :created, location: @konfirm }
      else
        format.html { render :new }
        format.json { render json: @konfirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /konfirms/1
  # PATCH/PUT /konfirms/1.json
  def update
    respond_to do |format|
      if @konfirm.update(konfirm_params)
        format.html { redirect_to @konfirm, notice: 'Konfirm was successfully updated.' }
        format.json { render :show, status: :ok, location: @konfirm }
      else
        format.html { render :edit }
        format.json { render json: @konfirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /konfirms/1
  # DELETE /konfirms/1.json
  def destroy
    @konfirm.destroy
    respond_to do |format|
      format.html { redirect_to konfirms_url, notice: 'Konfirm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_konfirm
      @konfirm = Konfirm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def konfirm_params
      params.require(:konfirm).permit(:no_order, :no_rek, :atas_nama, :jumlah, :user_id)
    end
end
