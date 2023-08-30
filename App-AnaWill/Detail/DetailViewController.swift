import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameHeroVillain: UILabel!
    @IBOutlet weak var heroVillainDescription: UILabel!
    @IBOutlet weak var heroVillainEmpresa: UILabel!
    @IBOutlet weak var heroVillainImageView: UIImageView!
    
    var heroesvillais : HeroesVillains!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroVillainImageView.layer.cornerRadius = 10
        heroVillainImageView.layer.masksToBounds = true
        heroVillainImageView.contentMode = .scaleAspectFill
        heroVillainImageView.backgroundColor = .purple
        
        configure(with: heroesvillais)
        
    }
    func configure(with herovillain: HeroesVillains) {
        nameHeroVillain.text = heroesvillais.name
        heroVillainEmpresa.text = herovillain.biography.fullName
        heroVillainDescription.text = herovillain.biography.firsAppearence
        heroVillainImageView.download(from: herovillain.image.url)

    }
}
