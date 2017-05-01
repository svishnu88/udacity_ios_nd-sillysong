//
//  ViewController.swift
//  Sily Song
//
//  Created by Vishnu Subramanian on 01/05/17.
//  Copyright © 2017 Vishnu Subramanian. All rights reserved.
//

import UIKit

func shortNameForName(name:String) -> String{
    let name = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    var shortName:String
    let firstVowel:String.Index! = name.rangeOfCharacter(from: vowelSet)?.lowerBound
    if firstVowel != nil{
        shortName = name.substring(from: firstVowel)
    }
    else{
        shortName = name
    }
    return shortName
    
    
}

func lyricsForName(lyricsTemplate:String,name:String) -> String{
    
    var lyricsTemplate = lyricsTemplate
    
    let shortName = shortNameForName(name: name)
    
    lyricsTemplate = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: name)
    
    lyricsTemplate = lyricsTemplate.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    
    return lyricsTemplate
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

class StyleViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let nameEntered = nameField.text
        if nameField.text != nil{
            let lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, name: nameEntered!)
            lyricsView.text = lyrics
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension StyleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

