//
//  GloboController.swift
//  SanaMente_Hack
//
//  Created by Alumno on 16/04/23.
//

import UIKit
import ARKit
import SceneKit

class GloboController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    
    var scene = SCNScene(named: "art.scnassets/mainScene.scn")!

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.scene = scene

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
    
           // Create a session configuration
           let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
    
           // Run the view's session
           sceneView.session.run(configuration)
        }
    //
       override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
    
           // Pause the view's session
           sceneView.session.pause()
       }
    
    func addAnimation(node: SCNNode){
        let inhale = SCNAction.scale(to: 1.4, duration: 4.0)
        let pause = SCNAction.wait(duration: 7.0)
        let exhale = SCNAction.scale(to: 1.0, duration: 8.0)
        
        let bSequence = SCNAction.sequence([inhale, pause, exhale])
        node.runAction(bSequence)
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        let containerNode = scene.rootNode.childNode(withName: "balloon reference", recursively: false)!
        addAnimation(node: containerNode)
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
