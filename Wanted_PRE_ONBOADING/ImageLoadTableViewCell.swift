//
//  ImageLoadTableViewCell.swift
//  Wanted_PRE_ONBOADING
//
//  Created by Bard on 2023/02/17.
//

import UIKit

final class ImageLoadTableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    var imageUrl: URL?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // 옵저버 등록
        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveTestNotification(_:)), name: NSNotification.Name.imageLoadCell, object: nil)
    }
    @objc func didRecieveTestNotification(_ notification: Notification) {
        loadImage()
    }
    
    @IBAction func loadImageAction(_ sender: UIButton) {
        loadImage()
    }
    
    func loadImage() {
        photoImageView.image = UIImage(systemName: "photo")
        guard let imageUrl = imageUrl else {
            return
        }
        photoImageView.imageFromServerURL(urlString: imageUrl)
    }
}
