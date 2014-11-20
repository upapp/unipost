class RegistersController < ApplicationController
  
  def index
	  @user = Register.new
    @users = Register.all
    @countries = Country.all
    @cities = City.all

  	case params[:rc]
  		when "-2"
  			@msg = "ERROR: Please contact dev team."
  		when "-1"
  			@msg = "ERROR: The user was not registered."
  		when "0"
  			@msg = "User registered !"
  		when "1"
  			@msg = "Warning: All the fields marked by (*) are mandatory !"
  		when "2"
  			@msg = "Country is empty."
  		when "3"
  			@msg = "Confirm email is empty."
  		when "4"
  			@msg = "Email is empty."
  		when "5"
  			@msg = "Last name is empty."
  		when "6"
  			@msg = "First name is empty."
  		when "7"
  			@msg = "Email does not match ( #{params[:mail]} != #{params[:cmail]} )."
  	end
  end

  def new	
  	@row = Register.create(first_name: params[:firstName], last_name: params[:lastName], email: params[:eMail], country: params[:country_id], city: params[:city_id])
  	if @row.save
  	  @country = Country.find(params[:country_id])
  	  @country.attributes.each do |attr_name, attr_value|
  	   if( attr_name.eql?"name" )
  	     @country_name = attr_value
  	   end
  	  end
  	  
  	  @city = City.find(params[:city_id])
  	  @city.attributes.each do |attr_name, attr_value|
  	    if( attr_name.eql?"name" )
  	     @city_name = attr_value
  	    end
  	  end
  	  
  	  @user = Register.new( first_name: params[:firstName], last_name: params[:lastName], email: params[:eMail], country: @country_name, city: @city_name )
  	  UserMailer.confirmation_email(@user).deliver
  	  
		  redirect_to :action => "index", :rc => 0
  	else
		  redirect_to :action => "index", :rc => -1
  	end
 
  end
  
  def create	
  	if
	  (
  		params[:firstName] != "" &&
  		params[:lastName] != "" &&
		  params[:eMail] != "" &&
		  params[:confirmEmail] != "" &&
  		params[:eMail] == params[:confirmEmail]
  	)
  
  		@params = [params[:firstName], params[:lastName], params[:eMail], params[:country], params[:city]]
  
  		@msg = "Please confirm the input information."
		
		  render "new"
  	elsif
  	(
    		params[:firstName] == "" &&
    		params[:lastName] == "" &&
  		  params[:eMail] == "" &&
  		  params[:confirmEmail] == ""
  	)
    	redirect_to :action => "index", :rc => 1
  	elsif( params[:eMail] != params[:confirmEmail] )
  		redirect_to :action => "index", :rc => 7, :mail => params[:eMail], :cmail => params[:confirmEmail]
  	elsif( params[:firstName] == "" )
  		redirect_to :action => "index", :rc => 6
  	elsif( params[:lastName] == "" )
  		redirect_to :action => "index", :rc => 5
  	elsif( params[:eMail] == "" )
  		redirect_to :action => "index", :rc => 4
  	elsif( params[:confirmEmail] == "" )
  		redirect_to :action => "index", :rc => 3
  	elsif( params[:country] == "" )
  		redirect_to :action => "index", :rc => 2
    else
    	redirect_to :action => "index", :rc => -2
    end
  end
end