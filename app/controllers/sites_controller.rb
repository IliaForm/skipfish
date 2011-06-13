#require 'open-uri'
class SitesController < ApplicationController
	before_filter :require_user    
    before_filter :find_site, :only => [:edit, :update, :show, :destroy, :check, :start, :result, :final]
    before_filter :allow_to_edit, :only => [:edit, :final]
      layout "layouts/applicationlena"

 
 def new
   @site = @current_user.sites.new
 end
  
 def create
   @site = @current_user.sites.new params[:site]
   if @site.save
     flash[:notice] = "Site created!"
     redirect_back_or_default account_url
   else
     render :action => :new
   end
 end
 
 def edit
 end
 
 def show
 end
 
  def update
  	good_params=@site.ready_to_check? ? ["url", "slovar"] : ["slovar"]
   if @site.update_attributes params[:site].slice *good_params
     flash[:notice] = "Site updated!"
     redirect_to @site 
   else
     render :action => :edit
   end
 end
 
 def destroy
  @site.destroy
     flash[:notice] = "Site deleted!"
     #render :action => :index
     redirect_back_or_default account_url
 end
 
  def check
    @key=HTTParty.get(@site.url.chomp('/')+'/fish.txt').body
    if @key==@site.token
     @site.status='checked'
    else
     @site.status='incorrect'
	  end
	 @site.save
   redirect_back_or_default site_url(:id=>@site.id)
  end
  
  def start
    @site.status = 'testing'
    @site.save!
    @site.skipfish
    flash[:notice]='Проверка выполняется, ожидайте результата'
    redirect_to @site
  end
  
	
  def result
   render :update do |page|
   	 page[:status].update @site.status
     page[:result].update @site.status == 'tested' ? link_to( 'результат', "/sites/#{@site.id}/results/" ) : simple_format(@site.last_result)
   end 
  end
  
  
  #def final 
  #	render :layout => false
  #end
  protected
  
  def find_site
   @site = current_user.sites.find params[:id] rescue render :template => 'shared/404'
  end
 
  def allow_to_edit
   render :template => '/shared/403' if @site.testing?
  end
 
end
