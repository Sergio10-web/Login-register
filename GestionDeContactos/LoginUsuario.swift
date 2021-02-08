


import UIKit
import Alamofire

class LoginUsuario: UIViewController {

    @IBOutlet weak var ir: UIButton!
    @IBOutlet weak var contraseñalogeo: UITextField!
  
    @IBOutlet weak var usuariologin: UITextField!
    
    let request = Request()

    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        ir.layer.cornerRadius = 10
  
    }

    
    @IBAction func logearusuario(_ sender: Any) {
      
        let alerterror = UIAlertController(title: "Algo salió mal", message: "Email o contraseña no valido vuelve a intentarlo", preferredStyle: .alert)
       
        let user : String = usuariologin.text!
        
        let pass : String = contraseñalogeo.text!
        
        
        request.upLogin(user: user, pass: pass)
            
        .validate(statusCode: 200..<300)
        .responseData { response in
             
             
             switch response.result {
                
             case .success:

                let alertacept = UIAlertController(title: "ok", message: "Usuario y contraseña correcto", preferredStyle: .alert)
   
                let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(_)in
                self.performSegue(withIdentifier: "listaMostrada", sender: self)
     })
 
                alertacept.addAction(OKAction)
                self.present(alertacept, animated: true, completion: nil)
              
             case let .failure(error):
                

                 alerterror.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                 self.present(alerterror, animated: true, completion: nil)
                 print(error)
             }
         }
        
        
        
        }
        
    }
    
    
 

 
