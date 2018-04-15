//
//  AboutYouViewController.swift
//  RajPatel_Assignment1
//
//  Created by Raj on 2018-02-12.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

class AboutYouViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfAddress: UITextField!
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var lbAge: UILabel!
    @IBOutlet var lbGender: UILabel!
    @IBOutlet var switchGender: UISwitch!
    @IBOutlet var dpDateOfBirth: UIDatePicker!
    //avatar buttons
    @IBOutlet var btnFirst: UIButton!
    @IBOutlet var btnSecond: UIButton!
    @IBOutlet var btnThird: UIButton!
    
    var imgAvatar: String?
    
    //function to hide keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    //Retireve all values and instantiate a User object
    @IBAction func formSubmitted(_ sender: UIButton) {
        //need name and email from the information entered
        let usName = tfName.text!
        let usAddress = tfAddress.text!
        let usPhone = tfPhone.text!
        let usEmail = tfEmail.text!
        let usAge = lbAge.text!
        let usGender = lbGender.text!
        let usDateOfBirth = dpDateOfBirth.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let userDateOfBirth: String = dateFormatter.string(from: usDateOfBirth)
        
        let usAvatar = imgAvatar
        
        if (usName == nil || usAddress == nil || usPhone == nil || usEmail == nil || usAge == nil || usGender == nil || usAvatar == nil ){
            //if any field is not provided, display an alert
            let alert = UIAlertController(title: "Error", message: "All fields are required. Don't forget to select the avatar", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in
                // do nothing
            })
            alert.addAction(okAction)
            present(alert, animated: true)
            
            return
        }
        
        //initialising a userdetail object
        
        let user: UserProfile = .init()
        user.name = usName
        user.address = usAddress
        user.phone = usPhone
        user.email = usEmail
        user.age = usAge
        user.gender = usGender
        user.dateOfBirth = userDateOfBirth
        user.avatar = usAvatar
        
        //insert this userDetail in the database
        
        
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let returnCode: Bool = mainDelegate.insert(intoDatabase: user)
        var returnMsg:String = "Person Added"
        if (returnCode == false) {
            returnMsg = "Person add Failed"
            
        }else{
            performSegue(withIdentifier: "SegueToUserData", sender: nil)
        }
        
        print(returnMsg)
        
    }
    
    // show slider value when the slider is changed
    @IBAction func sliderValueChanged (sender: UISlider) {
        let sliderVal = Int(sender.value)
        lbAge.text = "\(sliderVal)"
    }
    
    //function to change gender when the switch is changed
    @IBAction func switchGenderChanged(sender: UISwitch) {
        if sender.isOn {
            lbGender.text = "Male"
        }else {
            lbGender.text = "Female"
        }
    }
    
    @IBAction func avatarSelected(sender: UIButton) {
        switch sender.tag {
        case 0:
            //first avatar is selected
            imgAvatar = "firstAvatar.png"
            break
        case 1:
            //second avatar is selected
            imgAvatar = "secondAvatar.png"
            break
        case 2:
            //third avatar is selected
            imgAvatar = "thirdAvatar.png"
            break
        default: break
            //do nothing
        }
        print(imgAvatar ?? "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
