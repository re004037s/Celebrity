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
      text = <<-EOC    
      ---------------------------------
        不具合報告が来ました。

        ▼名前
        #{@name}
        ▼メールアドレス
        #{@mail}
        ▼種別
        #{@type}
        ▼内容
        #{@contents}
        EOC

      Slack.chat_postMessage username: @name,  text: text, channel: "#不具合報告フォーム"
      flash[:success] = "ご連絡ありがとうございます。対応いたします。"
     end
     redirect_to defect_forms_url
    end
    
    private
    def defectform_params
      params.require(:defect_form).permit(:type, :contents)
    end    
end