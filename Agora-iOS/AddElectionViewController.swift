//
//  AddElectionViewController.swift
//  Agora-iOS
//
//  Created by Hridik Punukollu on 22/03/20.
//  Copyright © 2020 Hridik Punukollu. All rights reserved.
//

import UIKit
import RealmSwift

class AddElectionViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var startDateButton: UIButton!
    @IBOutlet weak var endDateButton: UIButton!
    
    var startDate: Date = Date()
    var endDate: Date = Date()
    var election = ElectionData()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavbar()
        setUpTextField()
        doneButton.layer.cornerRadius = 25
    }
    
    func setUpTextField() {
        nameField.delegate = self
        descriptionField.delegate = self
        
        nameField.layer.cornerRadius = 25
        nameField.layer.borderColor = #colorLiteral(red: 0.7738122344, green: 0.7739246488, blue: 0.7737875581, alpha: 1)
        nameField.layer.borderWidth = 2
        let paddingViewTF = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.nameField.frame.height))
        nameField.leftView = paddingViewTF
        nameField.leftViewMode = UITextField.ViewMode.always
        
        descriptionField.layer.cornerRadius = 25
        descriptionField.layer.borderColor = #colorLiteral(red: 0.7738122344, green: 0.7739246488, blue: 0.7737875581, alpha: 1)
        descriptionField.layer.borderWidth = 2
        descriptionField.textContainerInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 5)
    }
    
    func setUpNavbar() {
        navigationController?.navigationItem.title = "Add Election"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0.5324117541, blue: 0.3027513623, alpha: 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nameField.layer.borderColor = #colorLiteral(red: 0, green: 0.5324117541, blue: 0.3027513623, alpha: 1)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameField.layer.borderColor = #colorLiteral(red: 0.7738122344, green: 0.7739246488, blue: 0.7737875581, alpha: 1)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        descriptionField.layer.borderColor =  #colorLiteral(red: 0, green: 0.5324117541, blue: 0.3027513623, alpha: 1)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        descriptionField.layer.borderColor = #colorLiteral(red: 0.7738122344, green: 0.7739246488, blue: 0.7737875581, alpha: 1)
    }

    @IBAction func startDateButtonPressed(_ sender: UIButton) {
        DatePickerDialog().show("Select Start Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", minimumDate: Date()) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateStyle = .long
                formatter.timeStyle = .long
                formatter.timeZone = TimeZone.current
                self.startDateButton.titleLabel?.text = formatter.string(from: dt)
                self.startDate = dt
                print(formatter.string(from: dt))
            }
        }
    }
    @IBAction func endDateButtonPressed(_ sender: Any) {
        DatePickerDialog().show("Select End Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", minimumDate: startDate) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateStyle = .long
                formatter.timeStyle = .long
                formatter.timeZone = TimeZone.current
                self.endDateButton.titleLabel?.text = formatter.string(from: dt)
                self.endDate = dt
                print(formatter.string(from: dt))
            }
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        if nameField.text != "" && descriptionField.text != "" && startDateButton.titleLabel?.text != "Select Date" && endDateButton.titleLabel?.text != "Select Date"{
            self.election.name = nameField.text!
            self.election.electionDescription = descriptionField.text!
            self.election.startingDate = self.startDate
            self.election.endingDate = self.endDate
            
            try! self.realm.write {
                realm.add(election)
            }
            print(self.election.name)
            
            nameField.text = ""
            descriptionField.text = ""
        
    }
        else {
            print("Enter all data before proceeding.")
        }
    }
}
