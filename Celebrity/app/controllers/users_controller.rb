class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :existence_user, only: [:show, :edit, :update]
  before_action :administrator_user, only: :new
  
  def index
    @users = User.page(params[:page])
  end
  
  def show
    @categories = MovieCategory.where(must_view: true).order('sort_order')
    
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      @user_tags = user.tags
    else
      @user_tags = current_user.tags
    end
  end
  
  
  def update_picture
    @user = current_user
    unless params[:user].try(:[],:picture) == nil
      upload_picture = user_params[:picture]
      if @user.update_columns(picture_file: upload_picture.read)
        flash[:success] = '画像を保存しました！'
        redirect_to @user 
      else
        flash[:error] = '画像の保存に失敗しました！'
        redirect_to @user
      end
    end
  end
  
  def get_image
    @image = current_user
    send_data(@image.picture_file)
  end
  
  def tag_show
    @user = current_user
    tag = @user.tags.create(tag: user_params[:tags])
    tag_name = user_params[:tags]
    if tag.save
      flash[:success] = 'タグ名： ' + tag_name + ' を追加しました'
      redirect_to @user 
    else
    ##[:tag]でメッセージの配列を取り出し、.join(' / ')で分割した。
    flash[:danger] = tag.errors.messages[:tag].join(' / ') 
    redirect_to @user
    end
  end
  
  def tag_delete
    @user = current_user
    # user_id = params[:user_id]
    tag_id = params[:tag_id]

    #invalid foreign key error -> modelにdestroy?? 関係の追記が必要？
    if @user.user_tags.find_by(id: tag_id).delete #tags ⇨ user_tags（中間テーブル）に変更
      flash[:success] = 'タグ を削除しました'
      redirect_to @user
    else
      flash[:success] = '削除失敗'
      redirect_to @user
    end
  end
  
  def tag_related
    #users tableのid, name, nickname, picture_fileだけ取得する 
    @hoge  = User.includes(:tags).where(tags:{tag: "#{params[:tag_name]}"}).pluck(:id,:name,:nickname, :picture_file)
    @hogehoge = @hoge.to_a
    render json: @hogehoge
  end
  
  def search
    @fetched_tags = Tag.where('tag LIKE(?)', "#{params[:keyword]}%")
    render json: @fetched_tags
  end
  
  def tags_belongs_to_user
    userid = params[:userid];
    @tags_row = Tag.includes(:users).where('users.id =?', userid).references(:posts)
    @foo = { userid => @tags_row }
    render json: @foo
  end
  
  def tag_edit
    # @tag = Tag.where('tag LIKE(?)', "#{params[:keyword]}%")
    # @tag = Tag.where("tag like '%'")
    @tags  = Tag.all
    
    # @tag  = User.includes(:tags).where(tags:{tags: })
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # 作成ユーザに紐付く進捗テーブルレコードの作成（nil回避）
      HtmlCssStatus.create(user_id: @user.id)
      JavascriptStatus.create(user_id: @user.id)
      RubyStatus.create(user_id: @user.id)
      RubyonrailsStatus.create(user_id: @user.id)
      RailstutorialStatus.create(user_id: @user.id)
      UserMovieStatus.create(user_id: @user.id)
      
      log_in @user
      flash[:success] = 'Welcome to the セレブエンジニアサロン'
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'ユーザ情報を更新しました'
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).update_attribute(:existence, false)
    flash[:success] = 'ユーザを削除しました'
    redirect_to users_path
  end
  
  
  private
  
    def user_params

      params.require(:user).permit(:tags, :name, :nickname, :line_id, :email, :password, :password_confirmation, :portfolio_path, :github_path, :picture_file, :picture)

    end
    
    # ログイン済み or 管理ユーザであれば true を返す
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user) || current_user.admin
    end
    
    # アクセスしようとしているページが削除ユーザのものである場合はルートURLへリダイレクト
    def existence_user
      @user = User.find(params[:id])
      redirect_to root_url unless existence_user?(@user)
    end


    # 管理者かどうか確認
    def administrator_user
      redirect_to root_url if current_user == nil || !current_user.admin
    end


end

    