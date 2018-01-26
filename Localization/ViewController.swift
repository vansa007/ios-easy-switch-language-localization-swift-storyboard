//
//  ViewController.swift
//  Localization
//
//  Created by Vansa Pha on 1/26/18.
//  Copyright © 2018 Vansa Pha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myName: UILabel!
    let preferredLanguage = Locale.current.languageCode
    var lanString: String = ""
    let myUser = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if let myLan = myUser.string(forKey: "myLan") {
            lanString = myLan
        }else {
            lanString = preferredLanguage!
        }
        myName.text = "vansa".localized(lang: lanString)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func englishAction(_ sender: UIButton) {
        myUser.set("en", forKey: "myLan")
        myUser.synchronize()
        reloadStoryBoard(lan: myUser.string(forKey: "myLan")!)
    }
    
    @IBAction func koreanAction(_ sender: UIButton) {
        myUser.set("ko", forKey: "myLan")
        myUser.synchronize()
        reloadStoryBoard(lan: myUser.string(forKey: "myLan")!)
    }
    
    func reloadStoryBoard(lan: String) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let storyBoardName = "Main"
        let path = Bundle.main.path(forResource: lan, ofType: "lproj")
        let bundle = Bundle(path: path!)
        let sb = UIStoryboard(name: storyBoardName, bundle: bundle)
        delegate.window?.rootViewController = sb.instantiateInitialViewController()
    }
}

extension String {
    
    func localized(lang: String) -> String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
}
