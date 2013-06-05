class KimurasController < ApplicationController
  # GET /kimuras
  # GET /kimuras.json
  before_filter :signed_in?

  def index
    @kimuras = Kimura.order("kimura_page").page(params[:page])
  end

  # GET /kimuras/1
  # GET /kimuras/1.json
  def show
    @kimura = Kimura.find(params[:id])
  end

  # GET /kimuras/new
  # GET /kimuras/new.json
  def new
    @kimura = Kimura.new
    @kimura.update_attributes(:kimura_isEdited => false)
    @kimura.update_attributes(:kimura_hasCandidates => false)
    @kimura.update_attributes(:kimura_wadoku_candidates => "")
  end

  # GET /kimuras/1/edit
  def edit
    @kimura = Kimura.find(params[:id])
    @ids = Array.new
    @variousIds = Array.new
    @entries = Array.new
    @selected_id = @kimura.wadoku ? @kimura.wadoku.entry : ""
   
    unless @kimura.kimura_wadoku_candidates == ""
    @ids = @kimura.kimura_wadoku_candidates.split(",").map(&:strip)
    @entries = Wadoku.find_all_by_entry(@ids)
    @entries << @kimura.wadoku if @kimura.wadoku.present?
    else
    @entries = Wadoku.where(:entry => "0000000")
    
    for ent in @entries
    @variousIds << ent.id
    end
    
    @entries << @kimura.wadoku if @kimura.wadoku.present?
end
  end

  # POST /kimuras
  # POST /kimuras.json
  def create
    @kimura = Kimura.new(params[:kimura])
    if @kimura.save
      redirect_to @kimura, :notice => 'Sie haben einen neuen Eintrag erstellt!'
    else
      render :action => "new"
    end
  end

  # PUT /kimuras/1
  # PUT /kimuras/1.json
  def update

    @kimura = Kimura.find(params[:id])
    new_wadoku_contents = params[:kimura].delete("wadoku")

unless params[:wadoku_entry] == nil
      if params[:wadoku_entry] != "new" 
      @kimura.wadoku = Wadoku.find_by_entry(params[:wadoku_entry])
      @kimura.user = User.find_by_id(current_user.id)
    else
      @kimura.user = User.find_by_id(params[current_user.id])
      @kimura.wadoku = Wadoku.create(entry: '0000000', contents: new_wadoku_contents) unless @kimura.wadoku && @kimura.wadoku.entry == 'new'
    end
    
else

    if params[:wadoku_id] != "new" 
      @kimura.wadoku = Wadoku.find_by_id(params[:wadoku_id])
      @kimura.user = User.find_by_id(current_user.id)
    else
      @kimura.user = User.find_by_id(params[current_user.id])
      @kimura.wadoku = Wadoku.create(entry: '0000000', contents: new_wadoku_contents) unless @kimura.wadoku && @kimura.wadoku.entry == 'new'
    end
end

    if @kimura.update_attributes(params[:kimura])
      redirect_to @kimura, :notice => 'Ihre Eingabe wurde erfolgreich bearbeitet!'
    else
      render :action => "edit"
    end

  end

  # DELETE /kimuras/1
  # DELETE /kimuras/1.json
  def destroy

    @kimura = Kimura.find(params[:id])
    @kimura.destroy

    redirect_to kimuras_url
  end

  private

  def signed_in?
    redirect_to root_path unless user_signed_in?
  end
end
