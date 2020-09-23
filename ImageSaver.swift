//
//  ImageSaver
//
//  Created by Micah Burnside on 9/23/20.
//  Copyright © 2020 Micah Burnside. All rights reserved.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    var saveDelegate: SaveImageProtocol?
    
    init(saveDelegate: SaveImageProtocol) {
        self.saveDelegate = saveDelegate
    }
    
    func saveToPhotoAlbum(image:UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
   @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            self.saveDelegate?.onError(error: error)
        } else {
            self.saveDelegate?.onSuccess()
        }
    }
}
