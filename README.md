# Rails315api project  https://github.com/dgleba/rail315api.git    David Gleba dgleba@gmail.com        ## Features  - api template app for rails 4  - devise token auth  - cancancan  - kaminari ransack pagination search is added, but still needs help to work - incomplete    ## Usage example:    c9.io - new hosted workspace - Clone from Git or Mercurial URL        https://github.com/dgleba/rail315api.git - click ruby  - createIn your project - in the bash prompt type:  bundle - use the c9 run project button - use insomnia or postman to access the app - use examples in this file to make requests.. rail315api/docs/example,client,json,requests.txt -    sign_up sign_in  -    sign_up assigns role of regular. -    get products.json - if signed in with email: r@e.com  pass: 12341234  -    then - delete products/1.json will be 403 forbidden due to cancancan roles  In https://github.com/dgleba/rail315api/blob/master/app/models/ability.rb#L18change: can [ :index, :show,  ], [ Product ]to:     can [ :index, :show, :delete ], [ Product ] The next request you make  to delete will work. # Based on..## Devise Token Auth Demo  2016-12-22https://github.com/lynndylanhurley/devise_token_auth_demoThis is a rails application fully configured to work with the [devise token auth](https://github.com/lynndylanhurley/devise_token_auth) gem.You can see a live demonstration of this app, along with the [ng-token-auth](https://github.com/lynndylanhurley/ng-token-auth) module for angular.js, [here](http://ng-token-auth-demo.herokuapp.com/).Documentation is available in the main repo for the [devise token auth gem](https://github.com/lynndylanhurley/devise_token_auth).