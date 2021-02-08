

import UIKit
import Foundation

class ListamostradaUsuarios: UIViewController, UITableViewDataSource, UITableViewDelegate {

 
    @IBOutlet weak var tableView: UITableView!
    let request = Request().GetUsers()
    var users : [String] = []


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        request.responseJSON {(responseData) in
            guard let data = responseData.data
            else{return}
            
            do{
                self.users = try
                    JSONDecoder().decode([String].self, from: data)
                self.tableView.reloadData()
                
            }catch{
                print(data)
            }
        }
        print(request)

    }
    
    @IBAction func mostrarlista(_ sender: Any) {
       
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        print(self.users.count, "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda") as! TableViewCell
        cell.nombreslista.text = users[indexPath.row]
        return cell
    }
}
