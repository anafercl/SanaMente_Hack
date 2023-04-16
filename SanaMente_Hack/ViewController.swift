//
//  ViewController.swift
//  SanaMente_Hack
//
//  Created by Alumno on 15/04/23.
//

import UIKit
import SwiftUI
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBSegueAction func showSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: CrearUsuarioView())
    }

}
