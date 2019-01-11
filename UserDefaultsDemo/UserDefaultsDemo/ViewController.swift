//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Alex Paul on 1/8/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // saving a name String to UserDefaults
    if let name = UserDefaults.standard.object(forKey: UserDefaultsKeys.name) as? String {
      updateNameButtonItem(name: name)
    } else {
      print("no name was found in UserDefaults")
      
      // if no name exists, then add your name
      // storing an object to UserDefaults
      let name = "Alex"
      
      UserDefaults.standard.set(name, forKey: UserDefaultsKeys.name)
      
      // add name to the nav bar
      updateNameButtonItem(name: name)
    }
    
    // set background color
    if let backgroundColor = UserDefaults.standard.object(forKey: UserDefaultsKeys.backgroundColor) as? String {
      view.backgroundColor = backgroundColor == "black" ? .black : .white
      navigationController?.navigationBar.barTintColor = backgroundColor == "black" ? .black : .white
      navigationController?.navigationBar.titleTextAttributes = backgroundColor == "black" ? [.foregroundColor: UIColor.white] :  [.foregroundColor: UIColor.black]

    } else {
      view.backgroundColor = .black
      navigationController?.navigationBar.barTintColor = .black
      navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
      
      print("no name was found")
      UserDefaults.standard.set("black",forKey: UserDefaultsKeys.backgroundColor)
    }
  }
  
  private func updateNameButtonItem(name: String) {
    let updatedName = name.lowercased().replacingOccurrences(of: " ", with: "")
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "@\(updatedName)", style: .plain, target: self, action: #selector(nameButtonPressed))
  }
  
  
  @objc private func nameButtonPressed() {
    let alertController = UIAlertController(title: "Name Settings", message: "Update your name and submit changes", preferredStyle: .alert)
    let submitAction = UIAlertAction(title: "Sumbit", style: .default) { action in
      if let updatedName = alertController.textFields?.first?.text {
        // update nav bar right bar button item
        self.updateNameButtonItem(name: updatedName)

        // save to user defaults
        UserDefaults.standard.set(updatedName, forKey: UserDefaultsKeys.name)
      }
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alertController.addTextField { (textfield) in
      textfield.textAlignment = .center
      textfield.placeholder = "add updted name here"
    }
    alertController.addAction(submitAction)
    alertController.addAction(cancelAction)
    present(alertController, animated: true, completion: nil)
  }
  
  @IBAction func toggleDarkMode(_ sender: UIBarButtonItem) {
    if var backgroundColor = UserDefaults.standard.object(forKey: UserDefaultsKeys.backgroundColor) as? String {
      view.backgroundColor = backgroundColor == "black" ? .white : .black
      
      navigationController?.navigationBar.barTintColor = backgroundColor == "black" ? .white : .black
      navigationController?.navigationBar.titleTextAttributes = backgroundColor == "black" ? [.foregroundColor: UIColor.black] :  [.foregroundColor: UIColor.white]
      
      backgroundColor = backgroundColor == "black" ? "white" : "black"
      UserDefaults.standard.set(backgroundColor, forKey: UserDefaultsKeys.backgroundColor)
      
      
    } else {
      view.backgroundColor = .black
      print("no name was found")
      UserDefaults.standard.set("black",forKey: UserDefaultsKeys.backgroundColor)
    }
  }
  


}

