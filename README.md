# Coding Challenge
## Installation
* Clone this repo `https://github.com/neutze/mobile-ios-app-cfw.git`
* Navigate to the folder and subfolder `cfw`
* Open `cfw.xcworkspace` and run the project on a device or simulator (optimized for iPhone XR)
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
##### Error
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/wireframes/error.png?raw=true "Wireframe Error")
#### Architecture
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/architecture/mvvm.png?raw=true "Architecture")
#### Model
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/model/athlete.png?raw=true "Model")
#### View Entity
![Alt text](https://github.com/neutze/mobile-ios-app-cfw/blob/master/.whiteboard/entity/athlete.png?raw=true "View Entity")
### Challenges faced during Project
#### iOS blocking `http` URLs
Since the provided mockable.io URL was only `http` and not `https`, iOS was blocking the connection to the endpoint. In order to fix this problem, I googled the error and found several solutions on stackoverflow. They all suggested to edit `NSAppTransportSecurity` in the `info.plist`. Even though there were a lot of similar solutions, none of the them worked in this case. In the end I fixed it by just changing the `http` URL to `https` and it worked without problems.
#### Working without Dependency Injection and Mock
In real projects, dependency injection and mock are fundamentals parts of development. Setting it up for a challenge requires initial effort that is covered by the advantages. Thus in a real project, this should be the first thing to be set up.
#### Race condition between pull to refresh and dialog
When receiving the result from downloading data and it is an error, a dialog is shown. This blocks the animation of pull to refresh to complete and thus stays in the loading state. In order to prevent this from happening, a delay for the dialog is added so the animation can finish first.
### Time invested
`~16 hours over three days`
## Next steps
The next steps of development would be
### Development
* More tests using mock as well as instrumented tests
* Dependency Injection
* RxSwift
* Dependency Management using CocoaPods or Carthage
* Codacy and/or linting for code quality
* CI system for testing and deployment
### Monitoring
* Firebase Crashlytics for stability tracking
* Firebase Performance for UI and network performance observation
* Firebase RemoteConfig for A/B testing
### UX
* Information architecture
* Response to user actions (Loading indicators, different states, error handling, UI refactoring)
* Layout adjustments to serve different device types
### Features
* AppIcon and nicer setup
* Athlete Images, workout details and result submission
* Local persistance
