

import Foundation
import Alamofire

class Request{
  
    func PostUsers(user: String, pass: String )->DataRequest{
        

        let url = URL(string:
        "https://superapi.netlify.app/api/register")

        let json = ["user" : user , "pass" : pass]
      return  AF.request(url!, method: .post, parameters: json, encoder: JSONParameterEncoder.default, headers: nil, interceptor:nil).response { response in
            debugPrint(response)
        }
    }
    
    
    func GetUsers()->DataRequest{
        let url = "https://superapi.netlify.app/api/users"
        

        return  AF.request( url ,method: .get,parameters: nil,encoding: URLEncoding.default,headers: nil,interceptor: nil)
          
        }
    
    
    func upLogin(user : String , pass: String)->DataRequest{
        let url = "https://superapi.netlify.app/api/login"
        
        let json = ["user" : user , "pass" : pass]

        return AF.request(url, method: .post, parameters:json , encoder: JSONParameterEncoder.default).response{ response in
             
            debugPrint(response)
    
        }
    }
        
                   // display alert with error message
                 }
            
        
        
    
        
    
    

