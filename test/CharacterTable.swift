//
//  CharacterTable.swift
//  test
//
//  Created by user_14 on 2017/6/19.
//  Copyright © 2017年 user_08. All rights reserved.
//

import UIKit

class CharacterTable: UITableViewController {

    var character = [["name":"戴斯蒙德·邁爾斯","image":true, "context":"戴斯蒙德·邁爾斯（1987年 - 2012年），亦即人們口中的 阿尼穆斯項目 實驗體17號，他是一名旅居隱士，也是眾多宣誓效忠刺客信條家族的後人；其中包括諸如 阿奎盧斯，阿泰爾·伊本-拉阿哈德，佛羅倫薩的埃齊奧·奧迪托雷以及康納·肯維等人。\n16 歲那年，戴斯蒙德開始厭倦了隱居生活，一心只想去追求他自己的夢想。藉助他習得的刺客基本技巧，戴斯蒙德逃離了他長大的地方－農場，並設法離開南達科達州，前往紐約，之後他在那裡一間酒吧做起了酒保。\n2012 年 9 月，戴斯蒙德被綁架並監禁於阿布斯泰戈工業公司（聖殿騎士組織），而後被強迫進入一部名為阿尼穆斯的機器以重現他祖先（阿泰爾·伊本-拉阿哈德）的記憶。他們的目的是得到一幅地圖，地圖詳細記錄了許多散落在地球各地的\"伊甸蘋果\"的位置。儘管戴斯蒙德極不情願，但最終還是成功完成了該任務。隨後，在卧底刺客露西·斯蒂爾曼的幫助下，他逃出了阿布斯泰戈，而後加入了義大利的刺客小組，組員包括露西、肖恩·黑斯廷斯和瑞貝卡·克瑞恩。為了提高他新習得的技巧，戴斯蒙德再度藉助 Animus，重現了埃齊奧·奧迪托雷的記憶。\n最終，得益於埃齊奧的記憶，戴斯蒙德和他的刺客分組得知了埃齊奧的伊甸蘋果之所在，它正躺在羅馬斗獸場的下面。雖然成功拿到神器，戴斯蒙德的身體被朱諾（第一文明成員之一）操控，然後被強迫殺死已經背叛刺客的露西。由於出血效應和精神壓力，戴斯蒙德進入昏迷狀態。威廉·邁爾斯和哈蘭·T·康寧漢姆將他放回animus。在animus中，他被送至黑屋，即理論上阿尼穆斯的 \"安全模式\" 。在他的前任克萊·卡茨馬雷克（實驗體16號）的人工智慧 AI 幫助下，戴斯蒙德總算恢復意識，醒後發現他已經被他父親轉移到了紐約。"]]
    var isUpdate = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isUpdate {
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at:[indexPath], with: UITableViewRowAnimation.automatic)
            isUpdate = false
        }
    }
    
     // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        character.remove(at: indexPath.row)
        tableView.reloadData()
    /*if editingStyle == .delete {
    // Delete the row from the data source
    tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }*/
    }
    
    func addCharacter(noti:Notification) {
        let tmp = noti.userInfo as?[String:Any]
        self.character.insert(tmp!, at: 0)
        isUpdate = true
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let notiName = Notification.Name("addCharacter")
        
        NotificationCenter.default.addObserver(self, selector: #selector(addCharacter(noti:)), name: notiName, object: nil)
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
        return character.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)

        // Configure the cell...
        let tmp = character[indexPath.row]
        cell.textLabel?.text = tmp["name"] as? String

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
            let controller = segue.destination as? CharacterDetailView
            let indexPath = tableView.indexPathForSelectedRow
            controller?.characterTmp = character[indexPath!.row]
            
        }
    }

}
