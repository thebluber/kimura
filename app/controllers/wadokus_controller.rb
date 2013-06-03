class WadokusController < ApplicationController
  # GET /wadokus
  # GET /wadokus.json
  def index
    @wadokus = Wadoku.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @wadokus }
    end
  end

  # GET /wadokus/1
  # GET /wadokus/1.json
  def show
    @wadoku = Wadoku.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @wadoku }
    end
  end

  # GET /wadokus/new
  # GET /wadokus/new.json
  def new
    @wadoku = Wadoku.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @wadoku }
    end
  end

  # GET /wadokus/1/edit
  def edit
    @wadoku = Wadoku.find(params[:id])
  end

  # POST /wadokus
  # POST /wadokus.json
  def create
    @wadoku = Wadoku.new(params[:wadoku])

    respond_to do |format|
      if @wadoku.save
        format.html { redirect_to @wadoku, :notice => 'Wadoku was successfully created.' }
        format.json { render :json => @wadoku, :status => :created, :location => @wadoku }
      else
        format.html { render :action => "new" }
        format.json { render :json => @wadoku.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wadokus/1
  # PUT /wadokus/1.json
  def update
    @wadoku = Wadoku.find(params[:id])

    respond_to do |format|
      if @wadoku.update_attributes(params[:wadoku])
        format.html { redirect_to @wadoku, :notice => 'Wadoku was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @wadoku.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wadokus/1
  # DELETE /wadokus/1.json
  def destroy
    @wadoku = Wadoku.find(params[:id])
    @wadoku.destroy

    respond_to do |format|
      format.html { redirect_to wadokus_url }
      format.json { head :no_content }
    end
  end
end
