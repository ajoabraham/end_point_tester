require "base64"


class ApiController < ApplicationController
  http_basic_authenticate_with name: "ajo", password: "secret", only: [:post_basic_auth,:get_basic_auth,:delete_basic_auth]
  skip_before_action :verify_authenticity_token
  
  def post_basic_auth
    puts request.body.read
    params[:got_it]="yeah"
    render json: params
  end
  
  def post_body
    puts request.body.read
    params[:got_it]="yeah"
    render json: params
  end
  
  def post_params
    puts params
    render json: params
  end
  
  def post_body64
    puts "undecoded: "
    undec = request.body.read
    puts undec
    puts "decoded: "
    dec = Base64.decode64(undec)
    puts dec
    
    render text: dec
  end
  
  def patch_body64
    puts "undecoded: "
    undec = request.body.read
    puts undec
    puts "decoded: "
    dec = Base64.decode64(undec)
    puts dec
    
    render text: dec
  end
  
  def get_params
    puts params
    params[:got_it] = "yeah"
    render json: params
  end
    
  def get_basic_auth
    puts params
    params[:got_it] = "yeah"
    render json: params
  end
  
  def delete_basic_auth
    puts params
    params[:got_it] = "yeah"
    render json: params
  end
end
