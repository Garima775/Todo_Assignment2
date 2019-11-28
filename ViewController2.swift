//
//  File name- ViewController2.swift
//  Author name- Garima Prasher
// App Name- ToDoAssignment2

// Student ID- 301093329
// file Description: this is the Details screen
//  Copyright © 2019 Garima Prasher. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet weak var inputTextField: UITextField!
    private var datePicker: UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        
         datePicker = UIDatePicker()
                datePicker?.datePickerMode = .date
                datePicker?.addTarget(self, action: #selector(ViewController2.dateChanged(datePicker:)), for: .valueChanged)
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController2.viewTapped(gestureRecognizer:)))
                view.addGestureRecognizer(tapGesture)
                
                inputTextField.inputView = datePicker
        }
            @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
                view.endEditing(true)
                
            }
            
            
            @objc func dateChanged(datePicker: UIDatePicker) {
                
             let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                
                inputTextField.text = dateFormatter.string(from: datePicker.date)
                view.endEditing(true)
        
    }
    @IBAction func Updatd(_ sender: UIButton) {
        let alertController:UIAlertController = UIAlertController(title: "Updation Alert", message: "Your description is updated", preferredStyle: UIAlertController.Style.alert)
        
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
        
      
    
        
    }
}
