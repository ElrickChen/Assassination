//
//  CharacterDetailView.swift
//  test
//
//  Created by user_14 on 2017/6/19.
//  Copyright © 2017年 user_08. All rights reserved.
//

import UIKit

class CharacterDetailView: UIViewController {
    var characterTmp:[String:Any]!
    
    @IBOutlet weak var charImg: UIImageView!
    @IBOutlet weak var charText: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = characterTmp["name"] as? String
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent(characterTmp["image"]! as! String)
        charImg.image = UIImage(contentsOfFile: url!.path)
        
        charText.text = characterTmp["context"] as? String
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
