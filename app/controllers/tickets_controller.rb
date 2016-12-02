class TicketsController < ApplicationController
  # before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_ticket, only: [:show, :edit, :update]
  before_action :admin_account, only: [:index]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    
     #Search based on email
    if params[:search]
      # select the ticket email which is a match for the search
      @tickets = Ticket.search(params[:search])
      @tickets = @tickets.order("created_at ASC")
    else
      @tickets = @tickets.order("created_at DESC")
    end
    
    #Search based on Ticket ID
    if params[:idsearch]
      # select the ticket number which is a match for the search
      @tickets = Ticket.idsearch(params[:idsearch])
      @tickets = @tickets.order("created_at ASC")
    else
      @tickets = @tickets.order("created_at DESC")
    end
    
    #Search based on Ticket Category
    if params[:catsearch]
      # select the ticket number which is a match for the search
      @tickets = Ticket.catsearch(params[:catsearch])
      @tickets = @tickets.order("created_at ASC")
    else
      @tickets = @tickets.order("created_at DESC")
    end
    
    #Search based on Ticket Product
    if params[:prodsearch]
      # select the ticket number which is a match for the search
      @tickets = Ticket.prodsearch(params[:prodsearch])
      @tickets = @tickets.order("created_at ASC")
    else
      @tickets = @tickets.order("created_at DESC")
    end
    
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:ttype, :email, :status, :title, :caselog, :category, :product, :solution, :account_id)
    end
    
    # Checks for admin user
    def admin_account
    redirect_to home_path unless current_user.admin?
    end
end
