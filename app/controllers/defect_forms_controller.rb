class DefectFormsController < ApplicationController
    before_action :logged_in_user, only: [:notify_to_slack ]

    def notify_to_slack
     @name = current_user.name
     @mail = current_user.email
     @type = params[:type]
     @contents = params[:contents][:contents]

     if  @contents.empty?
      flash[:danger] = "送信できませんでした。もう一度送信してください。"
      
     else
      notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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', username: @name
      notifier.ping(@contents)
      flash[:success] = "ご連絡ありがとうございます。対応いたします。"
     end
     redirect_to defect_forms_url
    end
    
    private
    def defectform_params
      params.require(:defect_form).permit(:type, :contents)
    end    
end