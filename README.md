In this Readme file I'm going to explain how I solved the memory leak charge due of the big amount of data received from the endpoint.
I decided to use a method which recharge the list while the user is scrolling down in the view, for avoid unnecessary memory use. Also I have adapted the search logic into
it. I chose MVVM as architecture for the project, and XCTest for Unit Test over Swift Testing (only 1 test added because of reasons explained below).
Remaining implementations not included due to lack of my time: Dynamic UI for portrait/landscape views, and favorite search/add/remove feature. I enjoyed
developing this app ♥