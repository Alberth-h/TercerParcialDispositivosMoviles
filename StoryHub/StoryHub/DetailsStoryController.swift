//
//  DetailsStoryController.swift
//  StoryHub
//
//  Created by Alberto Hoyos on 22/11/21.
//

import Foundation
import UIKit

class DetailsStoryController : UIViewController {
    var index : Int = -1
    var story : Story?
    var callbackUpdateTVStories : (() -> Void)?
    var callbackDeleteStory : ((Int) -> Void)?
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    @IBOutlet weak var lblIdEdit: UILabel!
    @IBOutlet weak var lblTitleEdit: UILabel!
    @IBOutlet weak var lblAuthorEdit: UILabel!
    @IBOutlet weak var lblDateEdit: UILabel!
    @IBOutlet weak var lblCountryEdit: UILabel!
    @IBOutlet weak var lblLanguageEdit: UILabel!
    @IBOutlet weak var lblPhoneEdit: UILabel!
    @IBOutlet weak var lblEmailEdit: UILabel!
    @IBOutlet weak var lblCategoryEdit: UILabel!
    @IBOutlet weak var lblContentEdit: UILabel!
    
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtLanguage: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtvContent: UITextView!
    
    @IBOutlet weak var sgmCategory: UISegmentedControl!
    
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var imgCategory: UIImageView!
    
    override func viewDidLoad() {
        self.title = "Read Story"
        
        lblId.text = "\("ID: ") \(story!.id)"
        lblTitle.text = story!.title
        lblAuthor.text = story!.author
        lblDate.text = story!.date
        lblCountry.text = story!.country
        lblLanguage.text = "\("Language: ") \(story!.language)"
        lblPhone.text = "\("Author Phone: ") \(story!.phone)"
        lblEmail.text = "\("Author Email: ") \(story!.email)"
        lblCategory.text = "\("Category: ") \(story!.category)"
        lblContent.text = story!.content
        imgCategory.image = UIImage(named: story!.category)
    
        txtId.text = story!.id
        txtTitle.text = story!.title
        txtAuthor.text = story!.author
        txtDate.text = story!.date
        txtCountry.text = story!.country
        txtLanguage.text = story!.language
        txtPhone.text = story!.phone
        txtEmail.text = story!.email

        if story!.category == "DailyLife"
        {
            sgmCategory.selectedSegmentIndex = 0
        }
        if story!.category == "Fun"
        {
            sgmCategory.selectedSegmentIndex = 1
        }
        if story!.category == "Fantasy"
        {
            sgmCategory.selectedSegmentIndex = 2
        }
        if story!.category == "Tip"
        {
            sgmCategory.selectedSegmentIndex = 3
        }
        if story!.category == "Love"
        {
            sgmCategory.selectedSegmentIndex = 4
        }
        if story!.category == "MysteryHorror"
        {
            sgmCategory.selectedSegmentIndex = 5
        }

        
        txtvContent.text = story!.content
    }
    
    @IBAction func doTapDelete(_ sender: Any) {
        callbackDeleteStory!(index)
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func doTapEdit(_ sender: Any) {
        self.title = "Edit Story"
        btnEdit.isEnabled = false
        btnEdit.isHidden = true
        btnDelete.isEnabled = false
        btnDelete.isHidden = true
        btnSave.isEnabled = true
        btnSave.isHidden = false
        btnCancel.isEnabled = true
        btnCancel.isHidden = false
        
        lblId.isHidden = true
        lblTitle.isHidden = true
        lblAuthor.isHidden = true
        lblDate.isHidden = true
        lblCountry.isHidden = true
        lblLanguage.isHidden = true
        lblPhone.isHidden = true
        lblEmail.isHidden = true
        lblCategory.isHidden = true
        lblContent.isHidden = true
        imgCategory.isHidden = true
        
        lblIdEdit.isHidden = false
        lblTitleEdit.isHidden = false
        lblAuthorEdit.isHidden = false
        lblDateEdit.isHidden = false
        lblCountryEdit.isHidden = false
        lblLanguageEdit.isHidden = false
        lblPhoneEdit.isHidden = false
        lblEmailEdit.isHidden = false
        lblCategoryEdit.isHidden = false
        lblContentEdit.isHidden = false
    
        sgmCategory.isEnabled = true
        sgmCategory.isHidden = false
        
        txtId.isEnabled = true
        txtId.isHidden = false
        txtTitle.isEnabled = true
        txtTitle.isHidden = false
        txtAuthor.isEnabled = true
        txtAuthor.isHidden = false
        txtDate.isEnabled = true
        txtDate.isHidden = false
        txtCountry.isEnabled = true
        txtCountry.isHidden = false
        txtLanguage.isEnabled = true
        txtLanguage.isHidden = false
        txtPhone.isEnabled = true
        txtPhone.isHidden = false
        txtEmail.isEnabled = true
        txtEmail.isHidden = false
        txtvContent.isEditable = true
        txtvContent.isSelectable = true
        txtvContent.isHidden = false
    }
    
    @IBAction func doTapSave(_ sender: Any) {
        btnEdit.isEnabled = true
        btnEdit.isHidden = false
        btnDelete.isEnabled = true
        btnDelete.isHidden = false
        btnSave.isEnabled = false
        btnSave.isHidden = true
        btnCancel.isEnabled = false
        btnCancel.isHidden = true
        
        lblId.isHidden = false
        lblTitle.isHidden = false
        lblAuthor.isHidden = false
        lblDate.isHidden = false
        lblCountry.isHidden = false
        lblLanguage.isHidden = false
        lblPhone.isHidden = false
        lblEmail.isHidden = false
        lblCategory.isHidden = false
        lblContent.isHidden = false
        imgCategory.isHidden = false
        
        lblIdEdit.isHidden = true
        lblTitleEdit.isHidden = true
        lblAuthorEdit.isHidden = true
        lblDateEdit.isHidden = true
        lblCountryEdit.isHidden = true
        lblLanguageEdit.isHidden = true
        lblPhoneEdit.isHidden = true
        lblEmailEdit.isHidden = true
        lblCategoryEdit.isHidden = true
        lblContentEdit.isHidden = true
        
        sgmCategory.isEnabled = false
        sgmCategory.isHidden = true
        
        txtId.isEnabled = false
        txtId.isHidden = true
        txtTitle.isEnabled = false
        txtTitle.isHidden = true
        txtAuthor.isEnabled = false
        txtAuthor.isHidden = true
        txtDate.isEnabled = false
        txtDate.isHidden = true
        txtCountry.isEnabled = false
        txtCountry.isHidden = true
        txtLanguage.isEnabled = false
        txtLanguage.isHidden = true
        txtPhone.isEnabled = false
        txtPhone.isHidden = true
        txtEmail.isEnabled = false
        txtEmail.isHidden = true
        txtvContent.isEditable = false
        txtvContent.isSelectable = false
        txtvContent.isHidden = true
        
        story!.id = txtId.text!
        story!.title = txtTitle.text!
        story!.author = txtAuthor.text!
        story!.date = txtDate.text!
        story!.country = txtCountry.text!
        story!.language = txtLanguage.text!
        story!.phone = txtPhone.text!
        story!.email = txtEmail.text!
        story!.content = txtvContent.text!
        
        if sgmCategory.selectedSegmentIndex == 0
        {
            story!.category = "DailyLife"
        }
        if sgmCategory.selectedSegmentIndex == 1
        {
            story!.category = "Fun"
        }
        if sgmCategory.selectedSegmentIndex == 2
        {
            story!.category = "Fantasy"
        }
        if sgmCategory.selectedSegmentIndex == 3
        {
            story!.category = "Tip"
        }
        if sgmCategory.selectedSegmentIndex == 4
        {
            story!.category = "Love"
        }
        if sgmCategory.selectedSegmentIndex == 6
        {
            story!.category = "MysteryHorror"
        }
        
        lblId.text = txtId.text!
        lblTitle.text = txtTitle.text!
        lblAuthor.text = txtAuthor.text!
        lblDate.text = txtDate.text!
        lblCountry.text = txtCountry.text!
        lblLanguage.text = "\("Language: ") \(story!.language)"
        lblPhone.text = "\("Author Phone: ") \(story!.phone)"
        lblEmail.text = "\("Author Email: ") \(story!.email)"
        lblContent.text = txtvContent.text!
        lblCategory.text = "\("Category: ") \(story!.category)"
        
        imgCategory.image = UIImage(named: story!.category)
        
        callbackUpdateTVStories!()
    }
    
    @IBAction func doTapCancel(_ sender: Any) {
        btnEdit.isEnabled = true
        btnEdit.isHidden = false
        btnDelete.isEnabled = true
        btnDelete.isHidden = false
        btnSave.isEnabled = false
        btnSave.isHidden = true
        btnCancel.isEnabled = false
        btnCancel.isHidden = true
        
        lblId.isHidden = false
        lblTitle.isHidden = false
        lblAuthor.isHidden = false
        lblDate.isHidden = false
        lblCountry.isHidden = false
        lblLanguage.isHidden = false
        lblPhone.isHidden = false
        lblEmail.isHidden = false
        lblCategory.isHidden = false
        lblContent.isHidden = false
        imgCategory.isHidden = false
        
        lblIdEdit.isHidden = true
        lblTitleEdit.isHidden = true
        lblAuthorEdit.isHidden = true
        lblDateEdit.isHidden = true
        lblCountryEdit.isHidden = true
        lblLanguageEdit.isHidden = true
        lblPhoneEdit.isHidden = true
        lblEmailEdit.isHidden = true
        lblCategoryEdit.isHidden = true
        lblContentEdit.isHidden = true
        
        sgmCategory.isEnabled = false
        sgmCategory.isHidden = true
        
        txtId.isEnabled = false
        txtId.isHidden = true
        txtTitle.isEnabled = false
        txtTitle.isHidden = true
        txtAuthor.isEnabled = false
        txtAuthor.isHidden = true
        txtDate.isEnabled = false
        txtDate.isHidden = true
        txtCountry.isEnabled = false
        txtCountry.isHidden = true
        txtLanguage.isEnabled = false
        txtLanguage.isHidden = true
        txtPhone.isEnabled = false
        txtPhone.isHidden = true
        txtEmail.isEnabled = false
        txtEmail.isHidden = true
        txtvContent.isEditable = false
        txtvContent.isSelectable = false
        txtvContent.isHidden = true
        
        txtId.text = story!.id
        txtTitle.text = story!.title
        txtAuthor.text = story!.author
        txtDate.text = story!.date
        txtCountry.text = story!.country
        txtLanguage.text = story!.language
        txtPhone.text = story!.phone
        txtEmail.text = story!.email

        if story!.category == "DailyLife"
        {
            sgmCategory.selectedSegmentIndex = 0
        }
        if story!.category == "Fun"
        {
            sgmCategory.selectedSegmentIndex = 1
        }
        if story!.category == "Fantasy"
        {
            sgmCategory.selectedSegmentIndex = 2
        }
        if story!.category == "Tip"
        {
            sgmCategory.selectedSegmentIndex = 3
        }
        if story!.category == "Love"
        {
            sgmCategory.selectedSegmentIndex = 4
        }
        if story!.category == "MysteryHorror"
        {
            sgmCategory.selectedSegmentIndex = 5
        }

        
        txtvContent.text = story!.content
    }
    
}
