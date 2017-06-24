//
//  CharacterTableAdder.swift
//  test
//
//  Created by Macintosh on 2017/6/24.
//  Copyright © 2017年 user_08. All rights reserved.
//

import UIKit

class CharacterTableAdder: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var charName: UITextField!
    @IBOutlet weak var charImg: UIImageView!
    @IBOutlet weak var charCtx: UITextView!


    @IBAction func save(_ sender: Any) {
        if charName.text?.characters.count == 0 {
            let controller = UIAlertController(title: "提醒", message: "名字空白", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in })
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            return
        }
        if charImg.image == nil {
            let controller = UIAlertController(title: "提醒", message: "選擇照片", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in })
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            return
        }
        
        let interval = Date().timeIntervalSinceReferenceDate
        let data = UIImageJPEGRepresentation(charImg.image!, 0.8)
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        
        let url = docUrl?.appendingPathComponent("\(interval)")
        try? data?.write(to: url!)
        
        let tmp = ["name":charName.text!,"image":"\(interval)", "context":charCtx.text!]
        let notiName = Notification.Name("AddCharacter")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: tmp)
        navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        charImg.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImage(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CharacterTableAdder.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
/*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
*/
/*
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
