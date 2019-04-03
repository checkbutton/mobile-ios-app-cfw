# Coding Challenge
## Installation
* Clone this repo `https://github.com/neutze/mobile-ios-app-cfw.git`
* Navigate to the folder and subfolder `cfw`
* Open `cfw.xcworkspace` and run the project on a device or simulator
## Documentation
### Problem Statement
Currently, there is no visibility for ranking and scores of participants from CrossFit Werk. In order to encourage motivation / competition, it is important to surface the Open's score to all participants.
### Assumptions for the Challenge
Participants scores are recorded by CFW however, there is no medium to surface this information.
### Hypothesis
I believe that providing a score chart of participants will result in increase completion rate and higher scores because I think that it will increase motivation and competitive spirit.
### How to measure success
* [Primary metric] Overall completion of participants who signed up for the challenge
* [Secondary metric] Increase in average score of the class
### Solution
Show list of participants with the most important information that will validate the hypothesis (name, score, rank).
### Acceptance Criteria
When application is opened, the download starts
* [On success] Display list of participants with rank and score
* [On error] Offer possibility to retry the download

Local storage is out of scope for the MVP
### Technical Solution
Technology: `iOS`

Language: `Swift`

Testing Frameworks: `XCode Test Navigator`

Backend: `mockable.io`
### Setup for the Challenge
* GitHub repository and project
* .gitignore
* README
* LICENSE
* Codacy
* mockable.io
### Technical Design & Whiteboarding
#### API Endpoint
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/api/athletes.png?raw=true "API")

```
{
 "athletes" : [
    {
        "id" : 51,
        "name": "Johannes Neutze",
        "score": 232,
    },
    {
        "id" : 43,
        "name": "Stefan Rothlehner",
        "score": 201,
    },
    {
        "id" : 1,
        "name": "Henning Heinrich",
        "score": 9,
    },
    {
        "id" : 5,
        "name": "Inga Tiedmers",
        "score": 48,
    },
    {
        "id" : 2,
        "name": "Hannes Klein",
        "score": 12,
    }
    ]
}
```
#### Wireframes
##### List
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/wireframes/list.png?raw=true "Wireframe List")
##### Loading
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/wireframes/loading.png?raw=true "Wireframe Loading")
##### Error
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/wireframes/error.png?raw=true "Wireframe Error")
#### Architecture
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/architecture/mvvm.png?raw=true "Architecture")
#### Model
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/model/athlete.png?raw=true "Model")
#### View Entity
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/entity/athlete.png?raw=true "View Entity")
