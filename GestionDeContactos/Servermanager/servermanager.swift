//
//  servermanager.swift
//  GestionDeContactos
//
//  Created by user176688 on 2/5/21.
//  Copyright © 2021 user176688. All rights reserved.
//

import Foundation
import Alamofire
class servermanager {
    
    static let sharedreferences = servermanager()
    
    
    func llamarservermanager(registro :Registromodelo ){
        
        
        
        
        let headers: HTTPHeaders =  [
        
            .contentType("Content-Type")]
        
        AF.request(urlregister, method: .post, parameters: registro,encoder: JSONParameterEncoder.default , headers: headers).response{ response in
            debugPrint(response)
            
            
            switch response.result{
            
            case .success(let data):
            do {
                
                let JSon = try JSONSerialization.jsonObject(with: data!, options:
                                                                [])
                print(JSon)
            } catch {
                print(error.localizedDescription)
            }
            case .failure(let error):
            
                print(error.localizedDescription)
            }
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
}
