class BillsController < ApplicationController
  
  def index
    respond_to do |format|
      format.html
      format.json do 
        @json_response = get_bill
        render json: @json_response
      end
    end
  end

  private 

    def get_bill
      api_response = ApiCaller.new.bill
      json_response = {}
      if (api_response.code == 200 && api_response.headers["content-type"] && api_response.headers["content-type"] == "application/json")
        json_response = JSON.parse(api_response.body)
      else
        json_response["errors"] = "Error on the API endpoint."
      end

      json_response
    end
end
