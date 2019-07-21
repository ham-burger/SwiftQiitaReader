//
//  ViewController.swift
//  SwiftQiitaReader
//
//  Created by kudo on 2019/07/21.
//  Copyright © 2019 kudo. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var data :Array<ItemDTO> = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let _ = Alamofire.request("https://qiita.com/api/v2/items",
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .response { [weak self] response in
                guard let wself = self else { return }
                if let data = response.data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    wself.data = (try? decoder.decode(Array<ItemDTO>.self, from: data)) ?? []
                    print("api suceed")
                    wself.tableView.reloadData()
                }
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = "\(data[indexPath.row].title)"
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    
}

struct ItemDTO: Codable {
    let title: String
}
