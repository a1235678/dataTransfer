//
//  movie.swift
//  dataTrans
//
//  Created by Apple Hsiao on 2016/11/11.
//  Copyright © 2016年 zeroplus. All rights reserved.
//

import UIKit

class movie: UIViewController {
    
    var movieDetail = MovieDetail()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //透過button & viewController之間連線的segue
        let controller = segue.destination as! EditMovie
        controller.editMovie = movieDetail
    }
    
    
    func updateInfo(){
        //更新畫面上的資訊
        nameLabel.text = movieDetail.name
        timeLabel.text = String(movieDetail.runtime)
        infoTextView.text = movieDetail.info
    }
    
    func getUpdateNoti(noti:Notification) {
        //接收編輯頁面回傳的資訊
        movieDetail = noti.userInfo!["PASS"] as! MovieDetail
        updateInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //接收編輯頁面回傳的資訊
        let notificationName = Notification.Name("GetUpdateNoti")
        NotificationCenter.default.addObserver(self, selector: #selector(getUpdateNoti(noti:)), name: notificationName, object: nil)
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
