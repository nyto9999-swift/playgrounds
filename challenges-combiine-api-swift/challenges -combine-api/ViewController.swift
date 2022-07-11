import UIKit
import Combine

class ViewController: UIViewController, ObservableObject {
    
    private var tableview: UITableView!
    private var api = API.shared
    var subscriptions = [AnyCancellable]()
    var stories = [Story]() {
        didSet {
            tableview.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        api.stories()
            .receive(on: DispatchQueue.main)
            .catch { _ in Empty() }
            .assign(to: \.stories, on: self)
            .store(in: &subscriptions)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(systemName: "star")
        content.text = stories[indexPath.row].title
        content.imageProperties.tintColor = .purple
        cell.contentConfiguration = content
        return cell
    }
}

