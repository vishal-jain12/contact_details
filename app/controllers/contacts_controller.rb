class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :load_viewable_count]
  impressionist actions: [:show]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts.desc.search(params[:search_by_name_or_number])
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact.contact_views.create!
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def sort
    @contacts = current_user.contacts
    if params[:field] == 'Name'
      @contacts = @contacts.sort_by{|contact| [contact.first_name, contact.middle_name, contact.last_name]}
    else
      @contacts = @contacts.sort_by{|contact| [contact.created_at]}
    end
    if params[:sort] == 'desc'
      @contacts = @contacts.reverse
    end
  end

  def load_viewable_count
    end_date = Date.today
    start_date = Date.today - 1.week
    data = []
    @views_count = @contact.contact_views.where('created_at >= ?', 1.week.ago).group('date(created_at)').count
    (start_date..end_date).map do |date|
      count = @views_count[date].present? ? @views_count[date] : 0
      data << [date.strftime('%d-%m-%Y'), count]
    end
    render json: [name: "View Count", data: data]
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = current_user.contacts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:first_name, :middle_name, :last_name, :email, :mobile_number, :landline_number, :notes, :image, :user_id)
    end
end
