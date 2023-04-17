//
//  MainController.swift
//  SanaMente_Hack
//
//  Created by Alejandro Dennis on 16/04/23.
//

import UIKit

class MainController: UIViewController {
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var prueba: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myName = UserDefaults.standard.string(forKey: "name")
        let myAvatar = UserDefaults.standard.string(forKey: "avatarID")
        
        nombre.text = "Hola, " + myName! + "!"
        avatar.image = UIImage(named: myAvatar!)
        prueba.text = myAvatar
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
