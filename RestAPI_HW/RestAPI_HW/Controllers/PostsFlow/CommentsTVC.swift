//
//  CommentsTVC.swift
//  RestAPI_HW
//
//  Created by Vitaliy Halai on 3.01.23.
//

import UIKit

class CommentsTVC: UITableViewController {
    
    var postID: Int?
    var comments: [Comment] = []
    
    override func viewWillAppear(_ animated: Bool) {
        fetchComments()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = comments[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = comment.name
        cell.detailTextLabel?.text = comment.body
        return cell
    }

    func fetchComments() {
        guard let postID else { return }
        let pathURL = "\(ApiConstants.commentsPath)?postId=\(postID)"
        guard let url = URL(string: pathURL) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data else {
                return
            }
            do {
                self.comments = try JSONDecoder().decode([Comment].self, from: data)
                print(self.comments)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
}
