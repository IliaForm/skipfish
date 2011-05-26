# encoding: utf-8
require 'digest/md5'
class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :buy_chances]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
    #if params[:message].present?
     #flash[:notice] = params[:message]
    #end 
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    logger.debug params[:user].inspect
    if @user.update_attributes params[:user] 
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def pay
  
  end
  
  def buy_chances
  	@user=@current_user
  	@user.balance-=100
  	@user.chances+=1
  	p @user.id
  	if @user.save
  	 flash[:notice] ='Попытки приобртены!'
  	else 
  	 flash[:notice] ='На Вашем балансе не хватает средств для этой операции.'
  	end 
  	redirect_to account_url
  end
  
  def create_md5 amount='0', paymentid='0'
  	secretkey='eO6n2SIgu6QX4XE80NZvegbPjXBNt28C6uG'	
	Digest::MD5.hexdigest(amount+params[:userid]+paymentid+secretkey)
  end
  
  
  def identificate 	
  	if create_md5 == params[:key]
  	 builder = Nokogiri::XML::Builder.new do |xml|
      xml.result {
        xml.code "YES"
      }
     end 
     render :xml => builder.to_xml
    else 
     builder = Nokogiri::XML::Builder.new do |xml|
      xml.result {
        xml.code "NO"
      }   
     end 
     render :xml => builder.to_xml
	end
  end	
  	
  
  def payment
  	if create_md5(params[:amount], params[:paymentid]) == params[:key]
  	  @user=User.find params[:userid]
  	  @user.balance+=params[:amount].to_f
  	  @user.save
  	   builder = Nokogiri::XML::Builder.new do |xml|
      xml.result {
        xml.id 
        xml.code "YES"
      }    
      end
      render :xml => builder.to_xml
  	else
  	  builder = Nokogiri::XML::Builder.new do |xml|
      xml.result {
        xml.id 
        xml.code "NO"
      }
      end
      render :xml => builder.to_xml
  	end  	
  end
  
end


