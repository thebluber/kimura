class KimurasController < ApplicationController
  # GET /kimuras
  # GET /kimuras.json

def index
    if user_signed_in? then
    @kimuras = Kimura.order("kimura_page").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @kimuras }
#      format.xml  { render :xml => @kimuras }
    end

     else
      render "notAuthorized"
     end

  end



def checkCands
    @kimuras = Kimura.where(:hasCandidates => false)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @kimuras }
    end
end

  # GET /kimuras/1
  # GET /kimuras/1.json
  def show
    @kimura = Kimura.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @kimura }
#      format.xml  { render :xml => @kimura }
    end
  end

  # GET /kimuras/new
  # GET /kimuras/new.json
  def new
    @kimura = Kimura.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @kimura }
    end
  end

  # GET /kimuras/1/edit
  def edit
    @kimura = Kimura.find(params[:id])  
    @myVar = @kimura.kimura_wadoku_candidates.split(" ")
#    @wadoku = Wadoku.where(:entry => "#{@myVar.last}")
    @newar = Wadoku.where(:entry => @myVar)
#    @wadoku = Wadoku.where("entry = ?",  params[@myVar.first])

  end

  # POST /kimuras
  # POST /kimuras.json
  def create

    if user_signed_in? then
    @kimura = Kimura.new(params[:kimura])

    respond_to do |format|
      if @kimura.save
        format.html { redirect_to @kimura, :notice => 'Sie haben einen neuen Eintrag erstellt!' }
        format.json { render :json => @kimura, :status => :created, :location => @kimura }
      else
        format.html { render :action => "new" }
        format.json { render :json => @kimura.errors, :status => :unprocessable_entity }
      end
    end

   else
	render "notAuthorized"
   end
end

  # PUT /kimuras/1
  # PUT /kimuras/1.json
  def update

    if user_signed_in? then
    @kimura = Kimura.find(params[:id])
    @link = Link.new
#    @usver = current_user
    @myVar = @kimura.kimura_wadoku_candidates.split(" ")
    @newar = Wadoku.where(:entry => @myVar)

    respond_to do |format|
      if @kimura.update_attributes(params[:kimura])
    
	params["dropdown_cases"].each do |cases|
 	@dropdown_value = cases.to_i
 	@link.update_attributes(:kimura => "#{@kimura.id}")
 	@link.update_attributes(:wadoku => "#{@dropdown_value}")
#	@link.update_attributes(:wadoku => @myVar[@dropdown_value - 1])
	@link.update_attributes(:student => "#{@current_user.id}")
		end
        @kimura.update_attributes(:kimura_isEdited => true)
        format.html { redirect_to @kimura, :notice => 'Ihre Eingabe wurde erfolgreich bearbeitet!.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @kimura.errors, :status => :unprocessable_entity }
      end
    end

else
	render "notAuthorized"
end

  end

  # DELETE /kimuras/1
  # DELETE /kimuras/1.json
  def destroy

    if user_signed_in? then
    @kimura = Kimura.find(params[:id])
    @kimura.destroy

    respond_to do |format|
      format.html { redirect_to kimuras_url }
      format.json { head :no_content }
    end
else
	render "notAuthorized"
end 

  end
end
