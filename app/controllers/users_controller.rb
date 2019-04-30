class UsersController < ApplicationController
  def input
  end
  def login
    id = "3MVG9zlTNB8o8BA33KqphDF3JCyUv00f_fZU4I6LAsDDhr8YPzkLJLUBnvlgK536essPLq7i_k6OXGAW0Xij7"
    secret = "4583116758607879757"
    token = "Dt6ii8ar1XcfdAfLcJQLc7Hx"
    @@client = Restforce.new(username: params[:input][:username],
                             password: params[:input][:password],
                             security_token: token,
                             client_id: id, client_secret: secret,
                             api_version: '42.0')
    redirect_to select_path
  end
  def select
  end
  def result
    track = params[:field][:item]
    query = "SELECT Description, Id, Name, StageName, Amount, TrackingNumber__c FROM Opportunity WHERE StageName = '#{track}'"
    @opportunities = @@client.query(query)
  end
  def update
    query = "SELECT Description, Id FROM Opportunity WHERE StageName = 'Qualification'"
    @opportunities = @@client.query(query)
    @opportunities.each do |row|
      @@client.update('Opportunity', Id: row.Id, TrackingNumber__c: '33223' )
    end
  end
end