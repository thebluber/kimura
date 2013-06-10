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
    @comment = Comment.new
  end

  # GET /kimuras/new
  # GET /kimuras/new.json
  def new
    @kimura = Kimura.new
  end

  # GET /kimuras/1/edit
  def edit
    @kimura = Kimura.find(params[:id])
    if current_user == @kimura.user
      @selected_id = @kimura.wadoku ? @kimura.wadoku.entry : ""
      @ids = @kimura.kimura_wadoku_candidates ? @kimura.kimura_wadoku_candidates.split(",").map(&:strip) : []
      @entries = Wadoku.find_all_by_entry(@ids)
      @entries << @kimura.wadoku if @kimura.wadoku.present?
    else
      redirect_to kimuras_path
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

    if params[:wadoku_id] != "new"
      @kimura.wadoku = Wadoku.find_by_entry(params[:wadoku_id])
    else
      @kimura.wadoku = Wadoku.create(entry: 'new', contents: new_wadoku_contents) unless @kimura.wadoku && @kimura.wadoku.entry == 'new'
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
