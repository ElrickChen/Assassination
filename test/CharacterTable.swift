//
//  CharacterTable.swift
//  test
//
//  Created by user_14 on 2017/6/19.
//  Copyright © 2017年 user_08. All rights reserved.
//

import UIKit

class CharacterTable: UITableViewController {

    var characters:[[String:Any]] = []
    var isAdd = false
    
    func getAddcharacterNoti(noti:Notification){
        let memory = noti.userInfo as? [String:Any]
        
        characters.insert(memory!, at: 0)
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("characters.txt")
        (characters as NSArray).write(to: url!, atomically: true)
        
        tableView.reloadData()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isAdd{
            isAdd = false
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
     // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        characters.remove(at: indexPath.row)
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("characters.txt")
        (characters as NSArray).write(to: url!, atomically: true)

        
        tableView.reloadData()
    /*if editingStyle == .delete {
    // Delete the row from the data source
    tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("characters.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil {
            characters = array as! [[String:Any]]
        }
        
        let notiName = Notification.Name("Addcharacter")
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterTable.getAddcharacterNoti(noti:)), name: notiName, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterTableCell

        // Configure the cell...
        let tmp = characters[indexPath.row]
        cell.charName.text = tmp["name"] as? String
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.destination is CharacterDetailView {
            let indexPath = tableView.indexPathForSelectedRow
            let tmp = characters[(indexPath?.row)!]
            let controller = segue.destination as! CharacterDetailView
            controller.characterTmp = tmp
        
        }
    }

}
