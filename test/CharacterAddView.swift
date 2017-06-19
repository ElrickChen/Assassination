//
//  CharacterAddView.swift
//  test
//
//  Created by user_14 on 2017/6/19.
//  Copyright © 2017年 user_08. All rights reserved.
//

import UIKit

class CharacterAddView: UIViewController {

    @IBOutlet weak var charName: UITextField!
    @IBOutlet weak var charImg: UIImageView!
    @IBOutlet weak var charText: UITextView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = charImg
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
        
    }
    @IBAction func done(_ sender: Any) {
        
        let tmp:[String:Any] = ["name":charName.text!, "image":" ","context":charText.text!]
        let notiName = Notification.Name("addCharacter")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: tmp)
        
        navigationController?.popViewController(animated: true)
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
