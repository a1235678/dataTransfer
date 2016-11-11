//
//  ViewController.swift
//  dataTrans
//
//  Created by Apple Hsiao on 2016/11/11.
//  Copyright © 2016年 zeroplus. All rights reserved.
//

import UIKit

struct MovieDetail{
    var order: Int!
    var name: String!
    var runtime: Int!
    var info: String!
//    init() {
//        self.order = 1
//        self.name = "AAA"
//        self.runtime = 2
//        self.info = "BBB"
//    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var movie1Button: UIButton!
    @IBOutlet weak var movie2Button: UIButton!
    @IBOutlet weak var movie3Button: UIButton!
    
    var movieDetail = MovieDetail()
    
    var movieArray = [MovieDetail(order: 0, name: "你的名字", runtime: 107, info: "有點複雜的愛情故事"),
                      MovieDetail(order: 1, name: "會計師", runtime: 128, info: "這是一個關於天才的故事"),
                      MovieDetail(order: 2, name: "列車上的女孩", runtime: 113, info: "別相信任何人"),]
    
    @IBAction func goDetail(_ sender: UIButton) {
        //透過viewController之間的連線 做segue
        self.performSegue(withIdentifier: "goDetail", sender: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //透過viewController之間的連線 做segue
        let tag = sender as! Int
        let controller = segue.destination as! movie
        controller.movieDetail = movieArray[tag]
    }
    
    func getUpdateNoti(noti:Notification) {
        //接收編輯頁面回傳的資訊
        movieDetail = noti.userInfo!["PASS"] as! MovieDetail
        movieArray[movieDetail.order] = movieDetail
        
        //print("\(noti.userInfo!["PASS"] )")
        
        //set current title
        if movieDetail.order == 0{
            movie1Button.setTitle(movieDetail.name, for: UIControlState.normal)
        }else if movieDetail.order == 1{
            movie2Button.setTitle(movieDetail.name, for: UIControlState.normal)
        }else if movieDetail.order == 2{
            movie3Button.setTitle(movieDetail.name, for: UIControlState.normal)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //接收編輯頁面回傳的資訊
        let notificationName = Notification.Name("GetUpdateNoti")
        NotificationCenter.default.addObserver(self, selector: #selector(getUpdateNoti(noti:)), name: notificationName, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        movie1Button.setTitle(movieArray[0].name, for: UIControlState.normal)
        movie2Button.setTitle(movieArray[1].name, for: UIControlState.normal)
        movie3Button.setTitle(movieArray[2].name, for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

