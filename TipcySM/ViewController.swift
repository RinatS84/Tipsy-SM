
import UIKit

class ViewController: UIViewController {
    
    let choiceView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 222/255, green: 248/255, blue: 236/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let centerStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 26
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    let selectTipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select tip"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
    }()
    
    let buttonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    let chooseSplitLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Split"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let chooseStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.contentMode = .scaleToFill
        stack.spacing = 27
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var zeroPctButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("0%", for: .normal)
        button.setTitleColor(UIColor(red: 79/255, green: 173/255, blue: 113/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var tenPctButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("10%", for: .normal)
        button.setTitleColor(UIColor(red: 79/255, green: 173/255, blue: 113/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var twentyPctButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("20%", for: .normal)
        button.setTitleColor(UIColor(red: 79/255, green: 173/255, blue: 113/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let splitNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 35)
        label.textColor = UIColor(red: 79/255, green: 173/255, blue: 113/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 2
        stepper.maximumValue = 25
        stepper.minimumValue = 2
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        stepper.stepValue = 1
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    let topStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 26
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    let enterBillLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let billTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(red: 79/255, green: 173/255, blue: 113/255, alpha: 1.0)
        textField.font = .systemFont(ofSize: 40)
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "e.g. 123.56"
        return textField
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 79/255, green: 173/255, blue: 113/255, alpha: 1.0)
        button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        return button
    }()
    
    let resultView = ResultVC()
    
    
   //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        constraints()
        
        
    }
    @objc func tipChanged(_sender: UIButton) {
        print(_sender.currentTitle!)
        
    }
    @objc func stepperValueChanged(_sender: UIStepper) {
        print(_sender.value)
    }
    @objc func calculatePressed(_sender: UIButton) {
        print(_sender.currentTitle!)
        
        present(resultView, animated: true, completion: nil)
    }
    
    
    func constraints() {
        view.addSubview(choiceView)
        view.addSubview(topStackView)
        view.addSubview(calculateButton)
        choiceView.addSubview(centerStackView)
        
        centerStackView.addArrangedSubview(selectTipLabel)
        centerStackView.addArrangedSubview(buttonsStackView)
        centerStackView.addArrangedSubview(chooseSplitLabel)
        centerStackView.addArrangedSubview(chooseStackView)
        
        buttonsStackView.addArrangedSubview(zeroPctButton)
        buttonsStackView.addArrangedSubview(tenPctButton)
        buttonsStackView.addArrangedSubview(twentyPctButton)
        
        chooseStackView.addArrangedSubview(splitNumberLabel)
        chooseStackView.addArrangedSubview(stepper)
        
        topStackView.addArrangedSubview(enterBillLabel)
        topStackView.addArrangedSubview(billTextField)
        
        
        NSLayoutConstraint.activate([
            choiceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            choiceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            choiceView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            choiceView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 40),
            
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            centerStackView.trailingAnchor.constraint(equalTo: choiceView.trailingAnchor, constant: -20),
            centerStackView.leadingAnchor.constraint(equalTo: choiceView.leadingAnchor, constant: 20),
            centerStackView.topAnchor.constraint(equalTo: choiceView.topAnchor, constant: 20),
            selectTipLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            selectTipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonsStackView.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: centerStackView.leadingAnchor),
            splitNumberLabel.heightAnchor.constraint(equalToConstant: 29),
            splitNumberLabel.widthAnchor.constraint(equalToConstant: 93),
            stepper.heightAnchor.constraint(equalToConstant: 29),
            stepper.widthAnchor.constraint(equalToConstant: 94),
            
            enterBillLabel.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor, constant: -50),
            enterBillLabel.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor, constant: 50),
            billTextField.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor),
            billTextField.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor),
            enterBillLabel.heightAnchor.constraint(equalToConstant: 30),
            billTextField.heightAnchor.constraint(equalToConstant: 48),
            
            
            
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
            
        ])
        
    }
    
}
