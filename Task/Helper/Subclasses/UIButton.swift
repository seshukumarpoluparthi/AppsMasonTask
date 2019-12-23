//
//  UIButton.swift
//  Task
//
//  Created by vamsi on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

@IBDesignable
class ATImageView: UIImageView {

    @IBInspectable var cornerRadius:CGFloat = 0.0{
        didSet{
            setupCornerRadius()
        }
    }
   
   @IBInspectable var roundImage:Bool = false{
      didSet{
         setupCornerRadius()
      }
   }
   
   
   private func setupCornerRadius(){
      layer.cornerRadius =  roundImage ? frame.height/2 : cornerRadius
   }
   
    override func draw(_ rect: CGRect) {
        clipsToBounds = true
        layer.masksToBounds = true
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
    
}
