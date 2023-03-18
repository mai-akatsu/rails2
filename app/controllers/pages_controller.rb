class PagesController < ApplicationController
  def home
  end
  
  def search
    if params[:address].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    else
      @rooms = Room.all
    end
  end
  
  def tokyo
      @rooms = Room.where('address LIKE ?', "%東京%")
  end
  
  def kyoto
      @rooms = Room.where('address LIKE ?', "%京都%")
  end
  
  def osaka
      @rooms = Room.where('address LIKE ?', "%大阪%")
  end
  
  def sapporo
      @rooms = Room.where('address LIKE ?', "%札幌%")
  end
end


