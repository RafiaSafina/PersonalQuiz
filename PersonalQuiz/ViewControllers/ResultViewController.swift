//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Рафия Сафина on 10.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    
}
