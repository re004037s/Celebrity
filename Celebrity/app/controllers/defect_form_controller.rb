class DefectFormController < ApplicationController
    before_action :logged_in_user, only: [:index, :create, :edit, :destroy]
    
    def index
      @defectform = DefectForm.all.page(params[:page]).per(15)
      @defectform = DefectForm.new
    end
    
    def create
      @defectform = current_user.defect_form.build(defectform_params)
      if @defectform.save
        flash[:success] = "ご連絡ありがとうございます。対応いたします。"
        redirect_to defect_form_url
      else
        flash[:danger] = "送信できませんでした。もう一度送信してください。"
        redirect_to :back
      end
    end    

  private
    def defectform_params
      params.require(:defect_form).permit(:name, :mail, :type, :contants )
    end    
    
end
