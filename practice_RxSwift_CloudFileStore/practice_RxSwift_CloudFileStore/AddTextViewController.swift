//
//  AddTextViewController.swift
//  practice_RxSwift_CloudFileStore
//
//  Created by 塩見陵介 on 2020/05/13.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import Firebase
import PKHUD

class AddTextViewController: UIViewController {
    
    enum textFieldTag: Int{
        case name = 0,
        sex,
        hobby,
        favoriteCake,
        submit,
        textFieldTagNum
    }
    // パーツ
    var nameField:  UITextField!
    var sexField:   UITextField!
    var hobbyField: UITextField!
    var cakeField:  UITextField!
    var submitButton:  UIButton!
    
    let dao = ProfileDao()

    @IBOutlet weak var addTextView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextView.delegate   = self
        addTextView.dataSource = self
        addTextView.separatorStyle = .none
        addTextView.isScrollEnabled = false
        addTextView.allowsSelection = false
        
        nameField  = UITextField()
        nameField.delegate = self
        
        sexField   = UITextField()
        sexField.delegate = self
        
        hobbyField = UITextField()
        hobbyField.delegate = self
        
        cakeField  = UITextField()
        cakeField.delegate = self
        
        submitButton = UIButton()
        submitButton.addTarget(self, action: #selector(submitFireBase(_:)), for: .touchUpInside)
    }
    
    // View作成
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let standardSize = CGRect(x: 120, y: 20, width: 200, height: 40)
        
        nameField.frame    = standardSize
        sexField.frame     = standardSize
        hobbyField.frame   = standardSize
        cakeField.frame    = standardSize
        submitButton.frame = standardSize
        
        nameField.bottomLine(color:  UIColor.lightGray)
        sexField.bottomLine(color: UIColor.lightGray)
        hobbyField.bottomLine(color: UIColor.lightGray)
        cakeField.bottomLine(color: UIColor.lightGray)
        
        submitButton.setTitle("アップ", for: .normal)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.backgroundColor = UIColor.systemBlue
        submitButton.layer.cornerRadius = 10
        submitButton.frame = CGRect(x: self.view.frame.width / 2 - 100, y: 20, width: 200, height: 40)
    }
    
    // ボタン押下時
    @objc func submitFireBase(_ sender: UIButton){
        
        HUD.show(.progress)
        
        var message = ""
        var dic = Dictionary<String, Any>()
        
        dic["createTime"] = Date()
        
        if(nameField.text == ""){
            message += "名前を入力してください。\n"
        }else{
            dic["name"] = nameField.text
        }
        if(sexField.text == ""){
            message += "性別を入力してください。\n"
        }else{
            dic["sex"] = sexField.text
        }
        if(hobbyField.text == ""){
            message += "趣味を入力してください。\n"
        }else{
            dic["hobby"] = hobbyField.text
        }
        if(cakeField.text == ""){
            message += "ケーキを入力してください。"
        }else{
            dic["cake"] = cakeField.text
        }
        
        if(message != ""){
            HUD.hide()
            let alert = UIAlertController(title: "注意", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }else{
            // firebase
            let result = dao.createProfile(dic: dic)
            if(result){
                HUD.hide()
            }else{
                let alert = UIAlertController(title: "注意", message:"アップに失敗しました。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true)
                return
            }
        }
    }
}

extension AddTextViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "プロフィールを作る"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textFieldTag.textFieldTagNum.rawValue
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddTextViewCell", for: indexPath)
        
        let label = UILabel(frame: CGRect(x: 20, y: 25, width: 80, height: 30))
        
        switch indexPath.row {
        case textFieldTag.name.rawValue:
            label.text = "名前"
            cell.addSubview(nameField)
            cell.addSubview(label)
            break
        case textFieldTag.sex.rawValue:
            label.text = "性別"
            cell.addSubview(sexField)
            cell.addSubview(label)
            break
        case textFieldTag.hobby.rawValue:
            label.text = "趣味"
            cell.addSubview(hobbyField)
            cell.addSubview(label)
            break
        case textFieldTag.favoriteCake.rawValue:
            label.text = "ケーキ"
            cell.addSubview(cakeField)
            cell.addSubview(label)
            break
        case textFieldTag.submit.rawValue:
            cell.addSubview(submitButton)
            break
        default:
            break
        }
        
        return cell
    }
}

extension AddTextViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
