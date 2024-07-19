//
//  ViewController.swift
//  storyboard-multilanguage
//
//  Created by Andrés Rechimon on 19/07/2024.
//

import UIKit

let LocalizeUserDefaultKey = "LocalizeUserDefaultKey"
var LocalizeDefaultLanguage = "es"

class ViewController: UIViewController {
    @IBOutlet weak var localizedLabel: UILabel!
    
    @IBOutlet weak var spanishButton: UIButton!
    
    @IBAction func spanishTapped(_ sender: Any) {
        LocalizeDefaultLanguage = "es"
        UserDefaults.standard.setValue(LocalizeDefaultLanguage, forKey: LocalizeUserDefaultKey)
        refreshLanguage()
    }
    
    @IBOutlet weak var englishButton: UIButton!
    @IBAction func englishTapped(_ sender: Any) {
        LocalizeDefaultLanguage = "en"
        UserDefaults.standard.setValue(LocalizeDefaultLanguage, forKey: LocalizeUserDefaultKey)
        refreshLanguage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshLanguage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocalizeDefaultLanguage = UserDefaults.standard.string(forKey: LocalizeUserDefaultKey) ?? "es"
    }

    private func refreshLanguage() {
        localizedLabel.text = "message".translated()
        spanishButton.setTitle("spanish-btn".translated(), for: .normal)
        englishButton.setTitle("english-btn".translated(), for: .normal)
    }
}

extension String {
    func translated() -> String {
        if let path = Bundle.main.path(forResource: LocalizeDefaultLanguage, ofType: "lproj"), let bundle = Bundle(path: path) {
                    return NSLocalizedString(self, bundle: bundle, comment: "")
                }
                
                return ""
    }
}

