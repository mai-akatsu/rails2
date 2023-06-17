class RoomsController < ApplicationController

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id

    if @room.save
      flash[:success] = "施設の登録に成功しました"
      redirect_to controller: :rooms, action: :show, id: @room.id
    else
      flash[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find(current_user.id)

    @reservations = Reservation.new
  end

  def own
    @rooms = current_user.rooms.all
  end
  
  def index
    @rooms = Room.where('address LIKE(?)',"%#{params[:address]}%")
   if params[:keyword].present?
    @rooms = Room.where([ 'content LIKE ? OR title LIKE ? ',"%#{params[:keyword]}%","%#{params[:keyword]}%" ])
   end
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    @room.user_id = current_user.id
    
    if @room.update(room_params)
      flash[:notice] = "保存しました。"
      redirect_to controller: :rooms, action: :show, id: @room.id
    else
      flash[:alert] = "問題が発生しました。"
      render "edit"
    end
  end
  
  def destroy
     @room = Room.find(params[:id])
     @room.destroy
     flash[:notice] = "ユーザーを削除しました"
     redirect_to :rooms
  end
  
  private
    def room_params
      params.require(:room).permit(:title, :content, :fee, :address, :image)
    end
end