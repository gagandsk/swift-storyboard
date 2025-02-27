//
//  ViewController.swift
//  StoryboardLab
//
//  Created by Gagandeep Dass Kaur on 27/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var buttons: UIButton!
    
    //obtener el valor del boton clicado
    @IBAction func actionButtons(_ sender: Any) {
        print((sender as AnyObject).titleLabel?.text ?? "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

