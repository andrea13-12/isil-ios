//
//  HttpRequestHelper.swift
//  EasyShoes
//
//  Created by Andrea Torres on 2/06/25.
//
import Foundation

class HttpRequestHelper{
    //se podra lalmar incluso cuando el metodo ya haya sido invocado
    func GET(url: String, completion: @escaping(Data?, String?) -> Void) {
        //validar que la url sea valida
        guard let url = URL(string: url) else{
            completion(nil, "Error: cannot create URL")
            return
        }
        
        //crear una solicitud
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        //crear una sesion
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: urlRequest) { Data, response, error in
            //valdidar que no haya error
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            //validar que haya datos
            guard let data = Data else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            //validar que la rpuesta sea success (200)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(data,"Error: HTTP request failed")
                return
            }
            completion(data, nil)
        }
        .resume()
    }
}
