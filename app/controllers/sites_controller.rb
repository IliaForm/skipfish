#require 'open-uri'
class SitesController < ApplicationController
	before_filter :require_user    
    before_filter :find_site, :only => [:edit, :show, :destroy]
    before_filter :allow_to_edit, :only => :edit
    
 def find_site
  @site = current_user.sites.find params[:id] rescue render :template => 'shared/404'
 end
 
 def allow_to_edit
   if @site.status == 'testing' 
   render :template => '/shared/403'
   end
 end 
 
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
   @site = @current_user.sites.find params[:id] 
   if @site.update_attributes params[:site]
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
    @site = @current_user.sites.find params[:id]
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
    @site = @current_user.sites.find params[:id]
    @site.skipfish
    flash[:notice]='Проверка выполняется, ожидайте результата'
    redirect_to @site
  end
  
	
  def result
   @site = @current_user.sites.find params[:id]
   render :update do |page|
   	 page[:status].update @site.status
     page[:result].update @site.status == 'tested' ? link_to( 'результат', final_site_path(:id=>@site.id) ) : simple_format(@site.last_result)
   end 
  end
  def final
  	@site = @current_user.sites.find params[:id] 
  	render :layout => false
  end
 end
