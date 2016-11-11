//
//  EditMovie.swift
//  dataTrans
//
//  Created by Apple Hsiao on 2016/11/11.
//  Copyright © 2016年 zeroplus. All rights reserved.
//

import UIKit

class EditMovie: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var timeLabel: UITextField!
    @IBOutlet weak var infoTextView: UITextView!
    
    
    var editMovie = MovieDetail()
    
    @IBAction func finished(_ sender: Any) {
        let notificationName = Notification.Name("GetUpdateNoti")
        
        //取畫面上的值
        editMovie.name = nameLabel.text
        editMovie.runtime = Int(timeLabel.text!)
        editMovie.info = infoTextView.text
        
        //發送通知
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["PASS":editMovie])
        
        //回到前一頁
        self.navigationController?.popViewController(animated: true)
    }




    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = editMovie.name
        timeLabel.text = String(editMovie.runtime)
        infoTextView.text = editMovie.info
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
