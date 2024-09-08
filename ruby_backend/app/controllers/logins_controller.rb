
require 'json'

class LoginsController < ApplicationController # Define la clase LoginsController que hereda de ApplicationController.
    def login
        puts params #parametros de la solicitud
        # En el cuerpo, se envía un objeto JSON usuario y contraseña como parámetros.
        response = HTTParty.post('http://localhost:8000/server/soap/?wsdl', body: {username: params[:username], password: params[:password]}.to_json, headers: { 'Content-Type' => 'application/json' })
        puts response.body

        return render :json => response.to_json
    end
end
