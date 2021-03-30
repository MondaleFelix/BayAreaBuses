//
//  RoutesCell.swift
//  BayAreaBuses
//
//  Created by Mondale on 3/27/21.
//

import UIKit

class RoutesCell: UITableViewCell {

    let busIcon = UIImageView()
    
    let departureLabel = UILabel()
    let arrivalLabel = UILabel()
    let distanceLabel = UILabel()
    let durationLabel = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        configureImageLabel()
        configureDepatureLabel()
        configureArrivalLabel()
        configureDurationLabel()
        configureDistanceLabel()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageLabel(){
        contentView.addSubview(busIcon)
        busIcon.translatesAutoresizingMaskIntoConstraints = false
        busIcon.image = UIImage(named: "bus")
        
        NSLayoutConstraint.activate([
            busIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            busIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            busIcon.heightAnchor.constraint(equalToConstant: 50),
            busIcon.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureDepatureLabel(){
        contentView.addSubview(departureLabel)
        departureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            departureLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            departureLabel.leadingAnchor.constraint(equalTo: busIcon.trailingAnchor, constant: 25),
            departureLabel.heightAnchor.constraint(equalToConstant: 25),
            departureLabel.widthAnchor.constraint(equalToConstant: 75)
        
        
        ])
    }
    
    private func configureArrivalLabel(){
        contentView.addSubview(arrivalLabel)
        arrivalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arrivalLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            arrivalLabel.leadingAnchor.constraint(equalTo: departureLabel.trailingAnchor, constant: 25),
            arrivalLabel.heightAnchor.constraint(equalToConstant: 25),
            arrivalLabel.widthAnchor.constraint(equalToConstant: 75)
        
        
        ])
    }
    
    
    private func configureDurationLabel(){
        contentView.addSubview(durationLabel)
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.adjustsFontSizeToFitWidth = true
        
        
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            durationLabel.heightAnchor.constraint(equalToConstant: 50),
            durationLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureDistanceLabel(){
        contentView.addSubview(distanceLabel)
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            distanceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            distanceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            distanceLabel.heightAnchor.constraint(equalToConstant: 25),
            distanceLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
}
