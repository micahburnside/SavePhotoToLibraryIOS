//
//  SaveImageProtocol
//
//  Created by Micah Burnside on 9/23/20.
//  Copyright © 2020 Micah Burnside. All rights reserved.
//

import Foundation

protocol SaveImageProtocol {
    func onSuccess()
    func onError(error: NSError)
}
