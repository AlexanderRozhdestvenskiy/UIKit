import UIKit

// Сложные представления

// UIScrollView

struct Item {
    let title: String
}

class MainViewController: UIViewController {
    
    private var items: [Item] = []
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collection)
        
        collection.backgroundColor = .systemBackground
        collection.register(Cell.self, forCellWithReuseIdentifier: "\(Cell.self)")
        collection.delegate = self
        collection.dataSource = self
        
        items = (0..<50).map(String.init).map(Item.init)
        collection.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        collection.frame = view.bounds
    }
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(Cell.self)", for: indexPath) as! Cell
        cell.tittle.text = items[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 56)
    }
}

class Cell: UICollectionViewCell {
    
    let tittle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tittle.frame = contentView.bounds.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

