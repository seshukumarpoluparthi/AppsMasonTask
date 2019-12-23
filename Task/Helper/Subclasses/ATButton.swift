//
//  ATButton.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

class ATButton: UIButton {
   
   @IBInspectable var cornerRadius:CGFloat = 0.0{
      didSet{
         setupCornerRadius()
      }
   }
   
   @IBInspectable var roundButton:Bool = false{
      didSet{
         setupCornerRadius()
      }
   }
   
   
   private func setupCornerRadius(){
      layer.cornerRadius =  roundButton ? frame.height/2 : cornerRadius
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setupButton()
   }
   
   required init?(coder aDecoder: NSCoder) {
      super.init(coder:aDecoder)
      setupButton()
   }
   
   func setupButton(){
      clipsToBounds = true
      layer.masksToBounds = false
   }
   
   
   
   @IBInspectable var shadowColor:CGColor = UIColor.black.cgColor{
      didSet{
         layer.shadowColor = shadowColor
      }
   }
   
   @IBInspectable var shadowOpacity:Float = 0.2{
      didSet{
         layer.shadowOpacity =  shadowOpacity
      }
   }
   
   @IBInspectable var shadowOffset:CGSize = .zero{
      didSet{
         layer.shadowOffset =  shadowOffset
      }
   }
   
   @IBInspectable var shadowRadius:CGFloat = 0.5{
      didSet{
         layer.shadowRadius =  shadowRadius
      }
   }
   
   @IBInspectable var borderColor:UIColor = UIColor.black{
      didSet{
         layer.borderColor =  borderColor.cgColor
      }
   }
   
   @IBInspectable var borderWidth:CGFloat = 0.1{
      didSet{
         layer.borderWidth =  borderWidth
      }
   }
}
