//
//  ScoreRatingViewController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 04.05.2021.
//

import UIKit

class ScoreRatingViewController: UIViewController {
    private var resultModel = [ResultModel]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ResultTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()

        loadResults()
    }

    func loadResults() {
        guard let folderPath = FileManager.createOrFindDirectory(named: "Results") else {
            return
        }

        guard let urls = try? FileManager.default.contentsOfDirectory(at: folderPath, includingPropertiesForKeys: nil, options: .includesDirectoriesPostOrder) else {
            return
        }

        for url in urls {
            guard let data = try? Data(contentsOf: url)  else {
                return
            }

            if let result = try? JSONDecoder().decode(ResultModel.self, from: data) {
                resultModel.append(result)
            }
        }
    }
}

extension ScoreRatingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if resultModel.count < 10 {
            return resultModel.count
        } else {
            return 10
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ResultTableViewCell else {
            return UITableViewCell()
        }

        let sortedResult = resultModel.sorted { Int($0.score) ?? 0 > Int($1.score) ?? 0 }
        print(sortedResult)

        cell.shipImage.image = UIImage(named: sortedResult[indexPath.row].ship)
        cell.nameLabel.text = sortedResult[indexPath.row].nickname
        cell.scoreLabel.text = sortedResult[indexPath.row].score
        cell.layer.borderWidth = 0.5
        return cell
    }
}
