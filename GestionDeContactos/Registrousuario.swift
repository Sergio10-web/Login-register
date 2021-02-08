


import UIKit
import Alamofire

let request = Request()

class Registrousuario: UIViewController {


    @IBOutlet weak var registroenviado: UIButton!
    @IBOutlet weak var repetircontrasena: UITextField!
    @IBOutlet weak var Nombreregistro: UITextField!
     let alert = UIAlertController(title: "Algo salió mal", message: "Las contraseñas no coinciden", preferredStyle: .alert)
    let alertEmail = UIAlertController(title: "Algo salió mal", message: "Email no valido", preferredStyle: .alert)
    @IBOutlet weak var contrasenaregistro: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        registroenviado.layer.cornerRadius = 10
        
        if let name = UserDefaults.standard.string(forKey: "name") {
            Nombreregistro.text = name
    }
  
    }
    

    @IBAction func EnviarRegistro(_ sender: Any) {
     
        let alerterror = UIAlertController(title: "Algo salió mal", message: "Email no valido debe rellenar el campo", preferredStyle: .alert)
     
        let user : String = Nombreregistro.text!
        let pass : String = contrasenaregistro.text!
        let pass2 : String = repetircontrasena.text!
        
        if(!user.isEmpty) || (!pass.isEmpty) {
                
         
            if (pass2.description == pass.description){
        request.PostUsers(user: user, pass: pass)
               .validate(statusCode: 200..<300)
               .responseData { response in
                    
                    
                    switch response.result {
                       
                    case .success:
                        

                       let alertacept = UIAlertController(title: "ok", message: "Usuario creado", preferredStyle: .alert)
          
                       let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(_)in
                       self.performSegue(withIdentifier: "registrolista", sender: self)
            })
        
                       alertacept.addAction(OKAction)
                       self.present(alertacept, animated: true, completion: nil)
                     
                    case let .failure(error):
                       

                        alerterror.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alerterror, animated: true, completion: nil)
                        print(error)
                    }
                }  }else{
                    print(" error de email")
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

                    // 4. Present the alert.
                    self.present(alert, animated: true, completion: nil)
                }
     
            }else{
               
                alertEmail.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

                // 4. Present the alert.
                self.present(alertEmail, animated: true, completion: nil)
            }
        
   
        }

     //convierto en booleano la funcion validar usuario
    private func validarUsuario(_ email: String) -> Bool {
 
    
              return true
        
    }
    
    
}
    
    



