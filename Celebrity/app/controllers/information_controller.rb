class InformationController < ApplicationController
    before_action :logged_in_user
    
    def show
        @input_information = Information.new
    end
    
    # お知らせの項目追加
    def create
        # 入力情報取得
        @information = Information.new(input_information_params)
        if !@information.info.empty? && !@information.display_period.nil?
          # 過去日付でなければ入力可能
          if @information.display_period >= Date.today
            if @information.save
              flash[:info] = "お知らせ『#{@information.info}』の入力完了いたしました"
            else
              flash[:danger] = "お知らせ保存時にエラーが発生しました"
            end
          else
            flash[:danger] = "期間は未来の日付を入力してください"
          end
        elsif @information.info.empty? && @information.display_period.nil?
          flash[:danger] = "お知らせ内容と期日が未入力です"
        elsif @information.info.empty?
          flash[:danger] = "お知らせ内容が未入力です"
        elsif @information.display_period.nil?
          flash[:danger] = "期日が未入力です"
        else
        end
        # 同ページを再読み込み
        redirect_to(:back)
    end
  
  private
    def input_information_params
      params.require(:information).permit(:info, :display_period)
    end
end
