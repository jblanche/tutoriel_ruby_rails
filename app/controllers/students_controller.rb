class StudentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate , :except => [:index, :show]

  def show
    @student = Student.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student }
    end
  end
  
  def majors
    @students = Student.majors
    respond_to do |format|
      format.html
      format.xml  { render :xml => @students }
    end
  end
  
  def index
    @students = Student.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @students }
    end    
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  # PUT /students/1
  # PUT /students/1.xml
  def update
    @student = Student.find(params[:id])
      if @student.update_attributes(params[:student])
        redirect_to(@student)
      else
        render :action => "edit"
      end
  end
  
  private  
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end
  
end
