class Site < ActiveRecord::Base
  validates :url,                 :presence => true, :format => /^https?:\/\/[\da-z\.:-]+\/?$/
  #validates :status,              :presence => true
  validates :user,                :presence => true
  belongs_to :user
  before_create :set_status_and_token
  
  def set_status_and_token
   self.status = "pending"
   self.token = ('0'..'z').entries.select{ |e| e[/\w|\d/] }.shuffle.join
  end
  
  def skipfish
    return false if user.chances<1
    path='/home/ilia/skipfish-1.86b/'
   	results="#{path}results/#{id}"
   	`mkdir #{results}`
   	`#{path}skipfish -o #{results} #{url}`
    self.result = `cat #{results}/index.html`
    save!
    user.reduce_chances 
    user.save!
    return true
  end  
  handle_asynchronously :skipfish
  
  def checked?
    status=="checked"
  end  
end