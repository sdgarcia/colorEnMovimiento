class VotesController < ApplicationController
  
  # GET /votes/new
  # GET /votes/new.json
  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote }
    end
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])

    if @vote.other.empty?
      @vote.other = "N/A"
    end

    if @vote.city_id.blank? 
        @vote.city_id = 6 #otra ciudad
    end

    respond_to do |format|
      if @vote.save
        format.html { redirect_to '/', notice: 'gracias por tu voto!' }
        format.js #{ render json: @vote, status: :created, location: @vote }
      else
        format.html { redirect_to '/', notice: 'gracias por tu voto!' }
        #format.html { render :action => 'static_pages/home', notice: 'no se pudo votar' }
        format.js   { render 'error.js.erb' }
        # format.js { render action: "static_pages/home", notice: 'no se pudo realizar su voto' }
        # format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  
end
