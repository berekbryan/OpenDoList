class TagsController < ApplicationController

  # list all tags for users
  def index
  	user = current_user
	@tags = user.tags.all
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end	
  end


  # GET /tags/new
  # GET /tags/new.xml
  def new
    user = current_user
    @tag = user.tags.push(Tag.new)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end


  # GET /tags/1/edit
  def edit
  	user = current_user  	
    @tag = user.tags.find(params[:id])
    
    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @tag }
    end    
  end


  # POST /tags
  # POST /tags.xml
  def create
	user = current_user
    @tag = user.tags.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to(tags_path, :notice => 'Tag was successfully created.') }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /tags/1
  # PUT /tags/1.xml
  def update
	user = current_user
    @tag = users.tags.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to(@tag, :notice => 'Tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
	user = current_user
	
    @tag = user.tags.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(tags_url) }
      format.xml  { head :ok }
    end
  end

end

