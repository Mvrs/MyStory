//
//  ViewController.swift
//  MyStory
//
//  Created by Marlon Johnson on 2/27/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    
    var contextItems = [
        ContextItem(role: "Engineer", location: "San Francisco", funFact: "Mars is a passionate engineer at Fullcourt who sees the world as a puzzle waiting to be solved. He spends his free time tinkering with machines and constantly looks for ways to improve existing designs. Mars is driven by the desire to create innovative solutions that make people's lives easier and better.", photo: "fullcourt-logo"),
        ContextItem(role: "UI/UX Designer", location: "Remote", funFact: "Mars is a passionate UI/UX designer who believes that good design can change people's lives. He's is always looking for new ways to create beautiful, functional, and user-friendly interfaces that delight and engage users. Mar's attention to detail and user-centric approach ensure that his designs not only look good but also provide a seamless and enjoyable user experience.", photo: "figma-logo"),
        ContextItem(role: "Musician", location: "London", funFact: "Mars is a passionate electronic music producer who sees music as a form of art that can move and inspire people. He spends countless hours experimenting with different sounds and beats, always striving to create unique and memorable tracks. Mars's dedication and love for electronic music are evident in his productions, which showcase his creativity and talent.", photo: "abelton-logo")
      ]

      override func viewDidLoad() {
          super.viewDidLoad()
          
          let imageView = UIImageView(image: UIImage(named: "profile-pic"))
          imageView.contentMode = .scaleAspectFit
          imageView.translatesAutoresizingMaskIntoConstraints = false
          imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
          view.addSubview(imageView)

          let tableView = UITableView(frame: .zero, style: .plain)
          tableView.translatesAutoresizingMaskIntoConstraints = false
          tableView.delegate = self
          tableView.dataSource = self
          tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
          view.addSubview(tableView)

          NSLayoutConstraint.activate([
              imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
              imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              imageView.heightAnchor.constraint(equalToConstant: 200)
          ])

          NSLayoutConstraint.activate([
              tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
              tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
          ])

      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return contextItems.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          let item = contextItems[indexPath.row]
          cell.textLabel?.text = "\(item.role)"
          return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          performSegue(withIdentifier: "detailSegue", sender: indexPath.row)
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "detailSegue",
             let selectedIndex = sender as? Int,
             let detailViewController = segue.destination as? DetailViewController {
              detailViewController.contextItem = contextItems[selectedIndex]
          }
      }
  }


