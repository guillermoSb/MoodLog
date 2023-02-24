//
//  MOCreateLogVC.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import UIKit

protocol MOCreateLogVCDelegate: AnyObject {
    func createLogVCDidCreateLog(_ log: Log)
}

class MOCreateLogVC: UIViewController {
    
    let currentDateLabel = MOBodyLabel(fontWeight: .semibold)
    let pickerLabel = MOSubtitleLabel()
    let moodChoicePicker = UIPickerView(frame: .zero)
    let activityLabel = MOSubtitleLabel()
    let stack1 = UIStackView()
    let stack2 = UIStackView()
    let createButton = UIButton()
    
    let activityChoice1 = MOLogActivityOption(with: .Study)
    let activityChoice2 = MOLogActivityOption(with: .WithFamily)
    let activityChoice3 = MOLogActivityOption(with: .WithFriends)
    let activityChoice4 = MOLogActivityOption(with: .Exercise)

    let moodPickerOptions: [MoodLevel] = [.Happy, .Disgust, .Sad, .Angry, .Scared]
    
    var selectedMood: MoodLevel? = .Happy
    var selectedActivity: LogActivity?
    
    weak var delegate: MOCreateLogVCDelegate?
    
    let padding: CGFloat = 12
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureLabels()
        configurePicker()
        configureActivities()
        configureButton()
        handleDisableButton()
        
    }
    
    func configureVC() {
        title = "Nueva Entrada"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGroupedBackground
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = cancel
    }
    
    func configureLabels() {
        pickerLabel.text = "Describe cómo te sientes actualmente"
        activityLabel.text = "Elige una actividad"
        currentDateLabel.text = Date.now.toLocaleString()
        let labels = [pickerLabel, currentDateLabel, activityLabel]
        for label in labels {
            view.addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ])
        }
        
        NSLayoutConstraint.activate([
            currentDateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            currentDateLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            pickerLabel.topAnchor.constraint(equalTo: currentDateLabel.bottomAnchor, constant: 40),
            pickerLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
  
        
        
    }
    
    func configurePicker() {
        view.addSubview(moodChoicePicker)
        moodChoicePicker.translatesAutoresizingMaskIntoConstraints = false
        moodChoicePicker.delegate = self
        moodChoicePicker.dataSource = self
        moodChoicePicker.selectRow(0, inComponent: 0, animated: true)
        
        moodChoicePicker.backgroundColor = .systemBackground
        moodChoicePicker.layer.cornerRadius = padding
    
        NSLayoutConstraint.activate([
            moodChoicePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            moodChoicePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            moodChoicePicker.topAnchor.constraint(equalTo: pickerLabel.bottomAnchor, constant: padding),
            moodChoicePicker.heightAnchor.constraint(equalToConstant: 120),
        ])
        
        NSLayoutConstraint.activate([
            activityLabel.topAnchor.constraint(equalTo: moodChoicePicker.bottomAnchor, constant: padding),
            activityLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
    }
    
    func configureActivities() {
        configure(stackView: stack1)
        configure(stackView: stack2)
        createActivityChoices()
        
        NSLayoutConstraint.activate([
            stack1.topAnchor.constraint(equalTo: activityLabel.bottomAnchor, constant: padding),
            stack1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stack1.heightAnchor.constraint(equalToConstant: 120),
            
            stack2.topAnchor.constraint(equalTo: stack1.bottomAnchor, constant: padding),
            stack2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stack2.heightAnchor.constraint(equalToConstant: 120)
        ])
        
    }
    
    private func configure(stackView: UIStackView) {
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 10
    }
    
    private func configureButton() {
        view.addSubview(createButton)
        createButton.setTitle("Crear", for: .normal)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.configuration = .tinted()
        createButton.configuration?.image = UIImage(systemName: "plus.circle.fill")
        createButton.configuration?.imagePadding = 6

        createButton.configuration?.titleAlignment = .leading
        
        createButton.addTarget(self, action: #selector(createTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: stack2.bottomAnchor, constant: padding),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            createButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    private func createActivityChoices() {
        activityChoice1.delegate = self
        activityChoice1.translatesAutoresizingMaskIntoConstraints = false
        activityChoice1.layer.cornerRadius = 12
        stack1.addArrangedSubview(activityChoice1)
        activityChoice1.backgroundColor = .systemBackground
        
        activityChoice2.delegate = self
        activityChoice2.translatesAutoresizingMaskIntoConstraints = false
        activityChoice2.layer.cornerRadius = 12
        stack1.addArrangedSubview(activityChoice2)
        activityChoice2.backgroundColor = .systemBackground
        
        activityChoice3.delegate = self
        activityChoice3.translatesAutoresizingMaskIntoConstraints = false
        activityChoice3.layer.cornerRadius = 12
        stack2.addArrangedSubview(activityChoice3)
        activityChoice3.backgroundColor = .systemBackground
        
        activityChoice4.delegate = self
        activityChoice4.translatesAutoresizingMaskIntoConstraints = false
        activityChoice4.layer.cornerRadius = 12
        stack2.addArrangedSubview(activityChoice4)
        activityChoice4.backgroundColor = .systemBackground
    }
    
    private func handleDisableButton() {
        guard selectedMood != nil, selectedActivity != nil else {
            createButton.isEnabled = false
            return
        }
        createButton.isEnabled = true
        
    }
    
    
    @objc func createTapped() {
        guard let delegate = delegate else {
            return
        }
        let log = Log(date: Date(), moodLevel: selectedMood!, activity: selectedActivity!)
        delegate.createLogVCDidCreateLog(log)
        self.delegate = nil
        dismiss(animated: true)
    }
    
    @objc func cancelTapped() {
        dismiss(animated: true)
    }

}

extension MOCreateLogVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moodPickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let option = moodPickerOptions[row]
        return option.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedMood = moodPickerOptions[row]
        handleDisableButton()
    }
    
    
}


extension MOCreateLogVC: MOLogActivityOptionDelegate {
    func logActivityOptionDidTap(_ activity: LogActivity) {
        let choices = [activityChoice1,activityChoice2,activityChoice3,activityChoice4]
        for choice in choices {
            if choice.activity == activity {
                choice.selected = true
                self.selectedActivity = activity
                handleDisableButton()
            } else {
                choice.selected = false
            }
        }
  
                
    }
}
