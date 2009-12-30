class CatagoriesController < ApplicationController
  # GET /catagories
  # GET /catagories.xml
  def index
    @catagories = Catagory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @catagories }
    end
  end

  # GET /catagories/1
  # GET /catagories/1.xml
  def show
    @catagory = Catagory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @catagory }
    end
  end

  # GET /catagories/new
  # GET /catagories/new.xml
  def new
    @catagory = Catagory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @catagory }
    end
  end

  # GET /catagories/1/edit
  def edit
    @catagory = Catagory.find(params[:id])
  end

  # POST /catagories
  # POST /catagories.xml
  def create
    @catagory = Catagory.new(params[:catagory])

    respond_to do |format|
      if @catagory.save
        flash[:notice] = 'Catagory was successfully created.'
        format.html { redirect_to(@catagory) }
        format.xml  { render :xml => @catagory, :status => :created, :location => @catagory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @catagory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /catagories/1
  # PUT /catagories/1.xml
  def update
    @catagory = Catagory.find(params[:id])

    respond_to do |format|
      if @catagory.update_attributes(params[:catagory])
        flash[:notice] = 'Catagory was successfully updated.'
        format.html { redirect_to(@catagory) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @catagory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /catagories/1
  # DELETE /catagories/1.xml
  def destroy
    @catagory = Catagory.find(params[:id])
    @catagory.destroy

    respond_to do |format|
      format.html { redirect_to(catagories_url) }
      format.xml  { head :ok }
    end
  end
end
