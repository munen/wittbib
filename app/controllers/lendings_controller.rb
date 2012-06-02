class LendingsController < InheritedResources::Base

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

end
