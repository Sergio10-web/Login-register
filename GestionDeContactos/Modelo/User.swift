

class User: Decodable,Encodable {
    var user : String
    var pass : String
   
    enum llavesNombres: String ,CodingKey {
        case user = "user"
        case pass = "pass"
    }
    
    init(user:String , passwor:String) {
        self.user = user
        self.pass = passwor
        
    }
    public func getUserlist()->[String:Any]{
    
        return ["user":user,"pass":pass]
    
    }
    public func upUserserver()->[String:Any]{
        
        return ["user":user,"pass":pass]
    
    }

    }

