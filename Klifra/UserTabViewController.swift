//
//  UserTabViewController.swift
//  Klifra
//
//  Created by Matthew Quinn on 11/12/24.
//

import UIKit
import SwiftUI

class UserTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up ContentView as a SwiftUI map view
        let userView = UserView()
        
        // Use UIHostingController to embed ContentView in this UIKit view controller
        let hostingController = UIHostingController(rootView: userView)
        
        // Add the hosting controller's view to the view hierarchy
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        // Set constraints to make the map fill the entire view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}