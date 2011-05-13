﻿class Site < ActiveRecord::Base
  validates :url,                 :presence => true, :format => /^https?:\/\/[\da-z\.:-]+\/?$/
  #validates :status,              :presence => true
  validates :user,                :presence => true
  belongs_to :user
  before_create :set_status_and_token
  
  def set_status_and_token
   self.status = "pending"
   self.token = ('0'..'z').entries.select{ |e| e[/\w|\d/] }.shuffle.join
  end
  
  
  def russian_
    self.class.dictionaries[slovar]
  end
  def self.dictionaries
    @dictionaries ||={ "minimal" => "Нормальная", "medium" => "Тщательная", "complete" => "Очень тщательная"}
  end

  def skipfish
  	self.status = 'testing'
    p status, id
    save!
    return false if user.chances<1
    path="#{Rails.root}/../../shared/sites/#{id}"
    `mkdir -p #{path}`
    `cd #{path}/../../ && cp -rf program/* sites/#{id}`
    results="#{path}/results"
    `rm -rf #{results}`
    `mkdir -p #{results}`  
   	`cd #{path} && cp dictionaries/#{slovar}.wl skipfish.wl`
    `cd #{path} && ./skipfish -o results #{url} > skipfish#{id}.log`
    self.result = `cat #{results}/index.html`
    self.status = 'tested'
    save!
    user.reduce_chances 
    user.save!
    return true
  end  
  handle_asynchronously :skipfish
  
  def ready_to_start?
    status == 'checked' or status == 'tested'
  end  
  
  def ready_to_view_result?
  	status == 'tested'
  end
  
  def last_result
  	file="/home/ilia/skipfish#{id}/skipfish#{id}.log"
  	return unless File.exists?(file)
  	f=File.open(file)
  	f.seek(-4000, IO::SEEK_END)
    log = f.read
	f.close
	log.scan(/(Scan statistics.+?)\e\[Hskipfish version/m).last.first.gsub(/\e\[\d;\d\dm/,'').gsub(/\n\s+/,"\n")
  rescue
 	nil
  end
  
  def testing?
    status == 'testing'
  end  
  def ready_to_check?
  	status == 'pending' or status == 'incorrect'
  end
end