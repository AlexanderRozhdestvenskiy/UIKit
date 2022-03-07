//
//  ViewController.swift
//  TinkoffFinnhub
//
//  Created by Alexander Rozhdestvenskiy on 07.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let companyName = UILabel()
    let country = UILabel()
    
    let companyNameLabel = UILabel()
    let countryLabel = UILabel()
    
    let pickerView = UIPickerView()
    let activityIndicator = UIActivityIndicatorView()
    
    private lazy var companies = [
        "Apple": "AAPL",
        "Microsoft": "MSFT",
        "Google": "GOOG",
        "Amazon": "AMZN",
        "Facebook": "FB"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    private func setup() {
        view.backgroundColor = .systemYellow
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        activityIndicator.hidesWhenStopped = true
    
        requestQuoteUpdate()
    }
    
    private func style() {
        companyName.translatesAutoresizingMaskIntoConstraints = false
        companyName.text = "Company name"
        companyName.textAlignment = .left
        
        country.translatesAutoresizingMaskIntoConstraints = false
        country.text = "Country"
        country.textAlignment = .left
        
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyNameLabel.text = "Tinkoff"
        companyNameLabel.textAlignment = .right
        
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.text = "USA"
        countryLabel.textAlignment = .right
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .medium
        activityIndicator.color = .black
    }
    
    private func layout() {
        view.addSubview(companyName)
        view.addSubview(country)
        
        view.addSubview(companyNameLabel)
        view.addSubview(countryLabel)
        
        view.addSubview(pickerView)
        view.addSubview(activityIndicator)
        
        companyName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        companyName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        
        country.topAnchor.constraint(equalTo: companyName.bottomAnchor, constant: 40).isActive = true
        country.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        
        companyNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        companyNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        countryLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 40).isActive = true
        countryLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        pickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func requestQuote(for symbol: String) {
        let token = "c6617h2ad3id7qljgfq0"
        
        guard let url = URL(string: "https://finnhub.io/api/v1/stock/profile2?symbol=\(symbol)&token=\(token)") else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let data = data, (response as? HTTPURLResponse)?.statusCode == 200, error == nil {
                self?.parseQuote(from: data)
            } else {
                print("Network Error")
            }
        }
        
        dataTask.resume()
    }
    
    private func parseQuote(from data: Data) {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data)
            
            guard
                let json = jsonObject as? [String: Any],
                let companyName = json["name"] as? String,
                let country = json["country"] as? String else { return print("Invalid JSON") }
            
            DispatchQueue.main.async { [weak self] in
                self?.displayStockInfo(companyName: companyName, country: country)
            }
        } catch {
            print("JSON parsing error: " + error.localizedDescription)
        }
    }
    
    private func displayStockInfo(companyName: String, country: String) {
        activityIndicator.stopAnimating()
        
        companyNameLabel.text = companyName
        countryLabel.text = country
    }
    
    private func requestQuoteUpdate() {
        activityIndicator.startAnimating()
        
        companyNameLabel.text = "-"
        countryLabel.text = "-"
        
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        let selectedSymbol = Array(companies.values)[selectedRow]
        requestQuote(for: selectedSymbol)
    }
}

// MARK: UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        companies.keys.count
    }
}

// MARK: UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(companies.keys)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        requestQuoteUpdate()
    }
}
