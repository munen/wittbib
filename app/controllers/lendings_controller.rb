# encoding: UTF-8

class LendingsController < InheritedResources::Base

  def new
    if Book.find(params[:book_id]).state == t(:not_available)
      redirect_to root_path, :alert => "Bereits ausgeliehen"
    else
      super
    end
  end

  def create
    @lending = Lending.new :book_id => params[:book_id].to_i,
      :customer_id => params[:lending][:customer_id].to_i
    @lending.taken_at = DateTime.now

    if @lending.valid?
      @lending.save!
      redirect_to root_path, :notice => "Buch ausgeliehen"
    else
      redirect_to root_path, :alert => "Fehler beim Ausleihen"
    end
  end

  # return a lent book
  def cancel
    @lending = Lending.find params[:id]
    @lending.returned_at = DateTime.now
    if @lending.save
      redirect_to lendings_path, :notice => "Buch ist wieder verfügbar"
    else
      redirect_to lendings_path, :alert => "Fehler beim Zurückgeben"
    end
  end


  def collection
    @lendings ||= Lending.not_available
  end

end
