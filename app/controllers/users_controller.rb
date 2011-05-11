require 'digest/md5'
class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :buy_chances]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
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
  	if @user.save
  	 flash[:notice] ='Попытки приобртены!'
  	else 
  	 flash[:notice] ='Покупка невозможна! Пополните Ваш баланс.'
  	end 
  	redirect_to account_url
  end
  
  def create_md5 amount='0', paymentid='0'
  	secretkey='58fjr07t34y50t73450t308rthpguctgn9i'	
	Digest::MD5.new(amount+params[:userid]+paymentid+secretkey)
  end
  
  def identificate 	
  	logger.debug create_md5
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
        xml.code "No"
      }   
     end 
     render :xml => builder.to_xml
	end
  end	
  	
  
  def success_payment
  	if create_md5(params[:amount], params[:paymentid])== params[:key]
  	  @user=User.find params[:userid]
  	  @user.balance+=params[:amount].to_f
  	   builder = Nokogiri::XML::Builder.new do |xml|
      xml.result {
        xml.id 
        xml.comment "Платёж произведён успешно"
        xml.course
      }    
      end
      render :xml => builder.to_xml
  	else
  	  builder = Nokogiri::XML::Builder.new do |xml|
      xml.result {
        xml.id 
        xml.comment "Платёж не удался"
        xml.course
      }
      end
      render :xml => builder.to_xml
  	end  	
  end
  
  def failed_payment
  	render :nothing=>true
  end
end


