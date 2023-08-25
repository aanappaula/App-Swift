import UIKit

class HeroViewController: UIViewController {
    //    private var heroes = [
    //      "Thor",
    //      "Homem Aranha",
    //      "Homem de Ferro",
    //      "Capitão América",
    //      "Homem Formiga"
    //   ]
    
    private let heroesvillains: [HeroesVillains] = [
        .init(name: "Thor", empresa: "Marvel", imagURL: ""),
        .init(name: "Homem Aranha", empresa: "Marvel", imagURL: ""),
        .init(name: "Homem de Ferro", empresa: "Marvel", imagURL: ""),
        .init(name: "Capitão América", empresa: "Marvel", imagURL: ""),
        .init(name: "Homem Formiga", empresa: "Marvel", imagURL: "")
    ]
    
    //1
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .purple
        label.numberOfLines = 0
        label.text = "Heróis da Marvel"
        return label
        
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        addViewInitHierarchy()
        setupConstraints()
        fetchRemoteHeroesVillains()
        
    }
    
    //2
    private func addViewInitHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
    }
    
    //3
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    private func fetchRemoteHeroesVillains () {
//        let url = ˜https://superheroapi.com/api/3976847639208455language=pt-BR˜
        let url = URL(string: "https://superheroapi.com/api/3976847639208455/search/man")!
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, _, error in if error == nil {return}
            
            guard let data else {return}
            print(data)
            
        }
    }
}

extension  HeroViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroesvillains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HeroesCell()
        let herovillain = heroesvillains[indexPath.row]
        cell.setup(herovillain: herovillain)
        return cell
    }
}

extension  HeroViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let herovillain = heroesvillains [indexPath.row]
        let storyboard  = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        detailViewController.heroesvillais = herovillain
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

