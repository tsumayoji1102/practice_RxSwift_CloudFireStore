//
//  ShowTextViewController.swift
//  practice_RxSwift_CloudFileStore
//
//  Created by 塩見陵介 on 2020/05/13.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import PKHUD

class ShowTextViewController: UIViewController {

    @IBOutlet weak var showTextView: UITableView!
    
    let dao = ProfileDao()
    var profileData: Array<Profile>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profileData = Array<Profile>()
        showTextView.delegate = self
        showTextView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        HUD.show(.progress)
        
        dao.readProfile(completion: { data in
            self.profileData = data
            self.showTextView.reloadData()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        HUD.hide()
    }
}

extension ShowTextViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "プロフィールを表示する"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowTextViewCell", for: indexPath)
        
        for subView in cell.subviews{
            subView.removeFromSuperview()
        }
        
        let profile = profileData[indexPath.row]
        
        let name = UILabel(frame: CGRect(x: 20, y: 20, width: 80, height: 20))
        name.text = "名前：\(profile.name)"
        
        let sex = UILabel(frame: CGRect(x: 120, y: 20, width: 80, height: 20))
        sex.text = "性別：\(profile.sex)"
        
        let hobby = UILabel(frame: CGRect(x: 20, y: 50, width: 80, height: 20))
        hobby.text = "趣味：\(profile.hobby)"
        
        let cake = UILabel(frame: CGRect(x: 120, y: 50, width: 200, height: 20))
        cake.text = "好きなケーキ：\(profile.hobby)"
        
        cell.addSubview(name)
        cell.addSubview(sex)
        cell.addSubview(hobby)
        cell.addSubview(cake)
        return cell
    }
    
    
    
}
