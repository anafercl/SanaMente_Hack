//
//  ViewController.swift
//  faceARTest
//
//  Created by Geraldine Torres on 15/04/23.
//

import UIKit
import SceneKit
import ARKit

class EmocionesController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var bottomLabel:UILabel!
    
    var bottomText = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        // ARFaceTrackingConfiguration = front camera
        let configuration = ARFaceTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    
    /* TEST ARFACETRACKING */
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let faceMesh = ARSCNFaceGeometry(device: sceneView.device!)
        
        let node = SCNNode(geometry: faceMesh)
                // SCNNode is a structural element of a scene graph, representing a position and transform in a 3D coordinate space.
                
                node.geometry?.firstMaterial?.fillMode = .lines
                // make it lines
        
        return node;
    }
    
    /// - Tag: ARFaceGeometryUpdate
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
        if let faceAnchor = anchor as? ARFaceAnchor, let faceGeometry = node.geometry as? ARSCNFaceGeometry {
                        faceGeometry.update(from: faceAnchor.geometry)
                    
                        readMyFace(anchor: faceAnchor)
                        DispatchQueue.main.async { self.bottomLabel.text = self.bottomText }
            }
    }
    
    func readMyFace(anchor: ARFaceAnchor) {
        let mouthSmileLeft = anchor.blendShapes[.mouthSmileLeft]
        let mouthSmileRight = anchor.blendShapes[.mouthSmileRight]
        let tongueOut = anchor.blendShapes[.tongueOut]
        let browDownLeft = anchor.blendShapes[.browDownLeft]
        let browDownRight = anchor.blendShapes[.browDownRight]
        
        
        self.bottomText = "¡Puedo verte!"
        
        if ((mouthSmileLeft?.decimalValue ?? 0.0) + (mouthSmileRight?.decimalValue ?? 0.0)) > 0.9 { self.bottomText = "¡Estás sonriendo!"
        }
        if tongueOut?.decimalValue ?? 0.0 > 0.1 {self.bottomText = "Estás sacando la lengua!"}
        
        if ((browDownLeft?.decimalValue ?? 0.0) + (browDownRight?.decimalValue ?? 0.0)) > 0.9 {
            self.bottomText = "Estás enojado?"
        }
        
        
    }
    
    
    // MARK: - ARSCNViewDelegate
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
