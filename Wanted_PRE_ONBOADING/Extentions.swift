//
//  Extentions.swift
//  Wanted_PRE_ONBOADING
//
//  Created by Bard on 2023/02/17.
//

import UIKit

extension UIImageView {
    public func imageFromServerURL(urlString: URL?) {
        guard let url = urlString else {
            return
        }
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print(error ?? "No Error")
                    return
                }
                DispatchQueue.main.async{ [weak self] in
                    if let image = UIImage(data: data!) {
                        self?.image = image
                    }
                }
            }).resume()
        }
    }
}

extension Notification.Name {
    static let imageLoadCell = Notification.Name("imageLoadCell")
}
