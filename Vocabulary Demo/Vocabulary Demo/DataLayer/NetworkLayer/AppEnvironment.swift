//
//  AppEnviroment.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation

struct AppEnvironment {

//used in build setting (other swift flags) to deterimine which enviroment
    static var apiURL : String {

        #if DEVELOPMENT
            return Constants.DEV
        #elseif QA
            return ""
        #elseif Stage
            return ""
        #elseif PRODUCTION
            return ""
        #else
            fatalError("issue !")
        #endif
    }


}
