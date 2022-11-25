//
//  ViewController.swift
//  SolarSystemARKit
//
//  Created by Ali serkan Boyracı  on 25.11.2022.
// new project

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let myBox = SCNBox(width: 0.1, height:0.1 , length: 0.1, chamferRadius: 0.1) // you can not only just box, also pentagon or heptagon. because you have 4 parameters.
        
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/wall.png") // giving texture to the box
        
        myBox.materials = [boxMaterial] // you can define material of your object
        
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5) // with CGFloat
        node.geometry = myBox
        sceneView.scene.rootNode.addChildNode(node) // to define rootnode

        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
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
