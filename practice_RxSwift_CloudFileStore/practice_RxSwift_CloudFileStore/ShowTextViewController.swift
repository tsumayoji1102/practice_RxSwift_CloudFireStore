//
//  ShowTextViewController.swift
//  practice_RxSwift_CloudFileStore
//
//  Created by 塩見陵介 on 2020/05/13.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit

class ShowTextViewController: UIViewController {

    @IBOutlet weak var showTextView: UITableView!
    
    //var list: Array<Profile>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ShowTextViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "プロフィールを作る"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddTextViewCell", for: indexPath)
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 80, height: 30))
        
       
        
        return cell
    }
    
    
    
}
