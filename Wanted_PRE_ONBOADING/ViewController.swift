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
        print("bard:::mainBtn")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let imageLoadCell = tableView.dequeueReusableCell(withIdentifier: "ImageLoadTableViewCell", for: indexPath) as? ImageLoadTableViewCell else {
            return UITableViewCell()
        }
        return imageLoadCell
    }
    
    
}
