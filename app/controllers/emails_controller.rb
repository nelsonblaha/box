class EmailsController < ApplicationController
  # http_basic_authenticate_with :name => "us", :password => "pass" 
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :check_created_email_or_is_admin, only: [:edit,:update,:destroy]

  # scaffold actions

    # GET /emails
    # GET /emails.json
    def index
      @emails = Email.all
      @emails = Email.search(params[:search])


      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @emails }
      end
    end

    # GET /emails/1
    # GET /emails/1.json
    def show
      @email = Email.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @email }
      end
    end
    # GET /emails/new
    # GET /emails/new.json
    def new

      @email = Email.new
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @email }
      end
    end

    # GET /emails/1/edit
    def edit
      @email = Email.find(params[:id])
    end

    # POST /emails
    # POST /emails.json
    def create
      @email = Email.new(params[:email])

      respond_to do |format|
        if @email.save

          # associate the email with the current user via a flagged Vote object
            @email.votes.create(user_id:current_user.id,creator:true)

          format.html { redirect_to @email, notice: 'Email was successfully created.' }
          format.json { render json: @email, status: :created, location: @email }
        else
          format.html { render action: "new" }
          format.json { render json: @email.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /emails/1
    # PUT /emails/1.json
    def update
      @email = Email.find(params[:id])

      respond_to do |format|
        if @email.update_attributes(params[:email])
          format.html { redirect_to @email, notice: 'Email was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @email.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /emails/1
    # DELETE /emails/1.json
    def destroy
      @email = Email.find(params[:id])
      @email.destroy

      respond_to do |format|
        format.html { redirect_to emails_url }
        format.json { head :no_content }
      end
    end

  def check_created_email_or_is_admin
    @email = Email.find(params[:id])
      unless current_user.admin || current_user.created_email(@email)
        redirect_to root_path, notice: "you can only do that to emails you create!"
      end
  end

  def toggle_upvote
    email = Email.find(params[:email])
      if current_user.voted_for(email)
        Vote.where(user_id:current_user.id,email_id:email.id).destroy_all
        redirect_to root_path, notice: "Down periscope!"
      else
        current_user.votes.create(email_id:email.id)
        redirect_to root_path, notice: "Up, up, and away!"
      end
  end
end
