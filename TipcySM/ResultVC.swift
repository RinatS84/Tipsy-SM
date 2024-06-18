
import UIKit

class ResultVC: UIViewController {

    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 222/255, green: 248/255, blue: 236/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let settingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Split between 2 people, with 10% tip."
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recalculate", for: .normal)
        button.backgroundColor = UIColor(red: 79/255, green: 173/255, blue: 113/255, alpha: 1.0)
//        button.setTitle("Calculate", for: .normal)
        button.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        return button
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total per person"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 45)
        label.text = "56.22"
        label.textColor = UIColor(red: 79/255, green: 173/255, blue: 113/255, alpha: 1.0)
        return label
    }()
    
    
    //MARK: -viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

       constraints()
        view.backgroundColor = .white
    }
    
    @objc func recalculatePressed(_sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func constraints() {
        
        view.addSubview(topView)
        view.addSubview(settingsLabel)
        view.addSubview(recalculateButton)
        
        topView.addSubview(topLabel)
        topView.addSubview(totalLabel)
        
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalToConstant: 300),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            
            settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            settingsLabel.heightAnchor.constraint(equalToConstant: 117),
            settingsLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            

            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.widthAnchor.constraint(equalToConstant: 200),
            recalculateButton.heightAnchor.constraint(equalToConstant: 54),
            
            topLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 36),
            
            totalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            totalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            totalLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            totalLabel.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
