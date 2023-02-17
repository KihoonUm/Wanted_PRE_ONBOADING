//
//  ViewController.swift
//  Wanted_PRE_ONBOADING
//
//  Created by Bard on 2023/02/16.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var imageLoadTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()

    }

    private func tableViewSetup() {
        let bundle = Bundle(for: type(of: self))
        imageLoadTableView.register(UINib(nibName: "ImageLoadTableViewCell", bundle: bundle), forCellReuseIdentifier: "ImageLoadTableViewCell")
        imageLoadTableView.delegate = self
        imageLoadTableView.dataSource = self
    }

    @IBAction func loadAllImagesAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: .imageLoadCell, object: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let imageLoadCell = tableView.dequeueReusableCell(withIdentifier: "ImageLoadTableViewCell", for: indexPath) as? ImageLoadTableViewCell else {
            return UITableViewCell()
        }
        imageLoadCell.imageUrl = imageUrls[indexPath.row]
        return imageLoadCell
    }
}

fileprivate let imageUrls = [URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRExJ9KzTJBbori4psz2bAVFDDux0-F_PJgow&usqp=CAU"),
                             URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_S_yQFcHSg3tocBkmEG-2GUwsOT8AR6atUQ&usqp=CAU"),
                             URL(string: "https://images.pexels.com/photos/2899710/pexels-photo-2899710.jpeg?cs=srgb&dl=pexels-jonathan-borba-2899710.jpg&fm=jpg"),
                             URL(string: "https://images.pexels.com/photos/3651597/pexels-photo-3651597.jpeg?cs=srgb&dl=pexels-luca-nardone-3651597.jpg&fm=jpg"),
                             URL(string: "https://images.pexels.com/photos/4380970/pexels-photo-4380970.jpeg?cs=srgb&dl=pexels-maksim-goncharenok-4380970.jpg&fm=jpg")]
