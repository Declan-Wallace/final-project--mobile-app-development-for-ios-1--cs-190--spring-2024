//
//  ViewController.swift
//  MemeMaker
//
//  Created by Declan Wallace on 5/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    let topChoices: [CaptionOption] = [
        CaptionOption(emoji: "👀", caption: "How I be when"),
        CaptionOption(emoji: "👩", caption: "The weems when"),
        CaptionOption(emoji: "🧍‍♂️", caption: "Yo my boi")
    ]
    
    let bottomChoices: [CaptionOption] = [
        CaptionOption(emoji: "💋", caption: "I need a fat kiss"),
        CaptionOption(emoji: "🌭", caption: "they got hotdogs"),
        CaptionOption(emoji: "🐴", caption: "the horse looks good")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSegmentedControls()
        updateTopCaptionLabel()
        updateBottomCaptionLabel()
    }
    
    func configureSegmentedControls() {
        topSegmentedControl.removeAllSegments()
        
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        
        topSegmentedControl.selectedSegmentIndex = 0
        bottomSegmentedControl.removeAllSegments()
        
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        
        bottomSegmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func topSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        updateTopCaptionLabel()
    }

    @IBAction func bottomSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        updateBottomCaptionLabel()
    }

    func updateTopCaptionLabel() {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
    }

    func updateBottomCaptionLabel() {
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
}
