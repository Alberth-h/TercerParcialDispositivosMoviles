//
//  AddStoryController.swift
//  StoryHub
//
//  Created by Alexia Ruiz Quiroz on 22/11/21.
//

import Foundation
import UIKit

class AddStoryController : UIViewController {
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtLanguage: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var sgmCategory: UISegmentedControl!
    @IBOutlet weak var txtvContent: UITextView!
    
    var callBackAddStory : ((Story) -> Void)?
    
    override func viewDidLoad() {
        self.title = "Add Story"
    }
    
    @IBAction func doTapSave(_ sender: Any) {
        let id = txtId.text!
        let title = txtTitle.text!
        let author = txtAuthor.text!
        let date = txtDate.text!
        let country = txtCountry.text!
        let language = txtLanguage.text!
        let phone = txtPhone.text!
        let email = txtEmail.text!
        var category = ""
        let content = txtvContent.text!
        
        
        if sgmCategory.selectedSegmentIndex == 0
        {
            category = "DailyLife"
        }
        if sgmCategory.selectedSegmentIndex == 1
        {
            category = "Fun"
        }
        if sgmCategory.selectedSegmentIndex == 2
        {
            category = "Fantasy"
        }
        if sgmCategory.selectedSegmentIndex == 3
        {
            category = "Tip"
        }
        if sgmCategory.selectedSegmentIndex == 4
        {
            category = "Love"
        }
        if sgmCategory.selectedSegmentIndex == 6
        {
            category = "MysteryHorror"
        }
        
        let story = Story(id: id, title: title, author: author, date: date, category: category, country: country, language: language, phone: phone, email: email, content: content)
        
        callBackAddStory!(story)
        self.navigationController?.popViewController(animated: true)
    }
    
}
