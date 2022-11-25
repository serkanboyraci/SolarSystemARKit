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
        
        /* let myBox = SCNBox(width: 0.1, height:0.1 , length: 0.1, chamferRadius: 0.01) // you can not only just box, also pentagon or heptagon. because you have 4 parameters. if you want more sphere you can give more number to chamferRadius
        let myBox = SCNSphere(radius: 0.1)
        
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/grass.png") // giving texture to the box
        
        myBox.materials = [boxMaterial] // you can define material of your object
        
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5) // with CGFloat
        node.geometry = myBox
        */
        
        let mySphere = createSphere(radius: 0.1, content: "grass.png", vector: SCNVector3(x: 0.1, y: 0.1, z: -1))
        sceneView.scene.rootNode.addChildNode(mySphere) // to define rootnode
        
        let mySphere2 = createSphere(radius: 0.1, content: "wall.png", vector: SCNVector3(x: 0.4, y: 0.1, z: -1))
        sceneView.scene.rootNode.addChildNode(mySphere2) // to define rootnode
        
        let mySphere3 = createSphere(radius: 0.1, content: "wood.jpg", vector: SCNVector3(x: 0.7, y: 0.1, z: -1))
        sceneView.scene.rootNode.addChildNode(mySphere3) // to define rootnode
        
        sceneView.automaticallyUpdatesLighting = true // to adjust light automatically

        

    }
    
    func createSphere(radius: CGFloat, content: String, vector: SCNVector3) -> SCNNode { // to define a func.
        let mySphere = SCNSphere(radius: radius)
        
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)") // giving texture to the box
        
        mySphere.materials = [boxMaterial] // you can define material of your object
        
        let node = SCNNode()
        node.position = vector // with CGFloat
        node.geometry = mySphere
        
        return node
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
