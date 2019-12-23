//
//  Constants.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

enum BaseUrl: String {
   case prod
   var value: String {
      switch self {
      case .prod: return "http://3.85.133.207/"
      }
   }
}

enum UserValidationState {
    case valid
    case invalid(String)
}


struct Constants {
static let baseurl = BaseUrl.prod.value
}


struct API {
   static let loginWithAuthUrl = Constants.baseurl + "celeb/loginwithAuth"
   static let loginUrl = Constants.baseurl + "celeb/login"
   static let signupUrl = Constants.baseurl + "celeb/register"
   static let homeUrl = Constants.baseurl + "celeb/viewRequests?status=1"
}

func showAlert(withMessage message: String? = nil, title: String = "Alert", okayTitle: String = "Ok", cancelTitle: String? = nil,viewController:UIViewController, okCall: @escaping () -> () = { }, cancelCall: @escaping () -> () = { }) {
   let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
   if let cancelTitle = cancelTitle {
      let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { (_) in
         cancelCall()
      }
      alert.addAction(cancelAction)
   }
   let okayAction = UIAlertAction(title: okayTitle, style: .default) { (_) in
      okCall()
   }
   alert.addAction(okayAction)
   viewController.present(alert, animated: true)
}

struct ATErrorMessage {
    struct Name {
        struct First {
            static let empty = "First Name can't be empty, Please provide one."
            static let invalid = "You have not enter a valid first name, Please try with another one."
        }
        static let spacesNotAllowed = "user name not accept space."
        static let empty = "Please Provide a name."
    }
    
    struct Unknown {
        static let title = "Oops!!"
        static let message = "Something Went Wrong! Our system may be having some trouble, Please try again later. We apologize for the inconvenience."
    }
    
    struct Server {
        static let checkConnection = "Please check your Internet connection"
        static let down = "Could not connect to server, Please check your internet connection and try again later."
        static let notFound = "The page you are looking for cannot be found. Drop us an email and let us know how you got here! You can also email us at: connect@liscio.me"
        static let corruptedResponse = "Unable to read data coming form the server."
        static let invalidKey = "Data received form server is not coming on a valid key."
    }
    
    struct Email {
        static let empty = "Please enter the registered email address."
        static let emptyNew = "Please provide an email address."
        static let invalid = "Please provide a valid email address."
        static let emptyType = "Please provide the Email Type"
        static let delete = "Are you sure you want to delete this email address?"
        static let invalidType = "Please select a valid Email Type"
        static let primaryUpdateFailure = "Primary email cannot be updated"
    }
   
    struct Password {
        static let empty = "Please enter the password associated with the email address."
        static let invalid = "Please enter the valid password."
        static let newEmpty = "Please enter the password."
        static let newConfirm = "Please enter the confirm password."
        static let notMatch = "Password and confirm password \n doesn't match."
        static let invalidRange = "Password should be greater than 6\n and less than 15 characters."
    }
    
    struct Phone {
        static let empty = "Please provide the Phone number."
        static let inValid = "Please provide the valid Phone number."
        static let delete = "Are you sure you want to delete this phone number?"
        static let emptyType = "Please provide the Phone Type"
        static let invalidType = "Please select a valid Phone Type"
        
    }
   struct Gender {
       static let empty = "Please enter the gender."
   }
   
   struct Country {
       static let empty = "Please enter the Country."
   }
}
