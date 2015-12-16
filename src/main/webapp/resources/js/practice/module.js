///////////////////////////////////////////////////////////////////////////////
// Value Module
///////////////////////////////////////////////////////////////////////////////
angular.module('valueModule', [])
	// registering value
	.value('vperson', {
		firstname: "",
		lastname: "",
		
		// function for full name
		fullname: function (){
			return this.firstname + ' ' + this.lastname;
		}
	}).controller('valueController', function ($scope, vperson){
		// Intializing model
		vperson.firstname = "Yagna";
		vperson.lastname = "Shree";
		
		$scope.personInstance = vperson;
	});

///////////////////////////////////////////////////////////////////////////////
// Service Module
///////////////////////////////////////////////////////////////////////////////

// creating service
var personManager = function(sperson){
	this.personInstance = sperson;
};

personManager.prototype.getFirstName = function(){
	return this.personInstance.firstname;
};
personManager.prototype.getLastName = function(){
	return this.personInstance.lastname;
};
personManager.prototype.getFullName = function(seperator){
	return this.personInstance.firstname+seperator+this.personInstance.lastname;;
};

// controller definition
angular.module('serviceModule', [])
	// registering value
	.value('sperson', {
		firstname: "",
		lastname: ""
	})
	// registering service
	.service('personManager', personManager)
	.controller('serviceController', function($scope, sperson, personManager){
		sperson.firstname = "Yagna";
		sperson.lastname = 'Shree';
		
		$scope.personManagerInstance = personManager;
	});

///////////////////////////////////////////////////////////////////////////////
// Factory Module
///////////////////////////////////////////////////////////////////////////////	

// creating factory
var PersonFactory = function(fperson){
	var fpersonInstance = fperson;
	
	return {
		getFirstName: function(){
			return fpersonInstance.firstname;
		},
		getLastName: function(){
			return fpersonInstance.lastname;
		},
		getFullName: function(seperator){
			return fpersonInstance.firstname+seperator+fpersonInstance.lastname;
		},
	};
};

// controller definition
angular.module('factoryModule', [])
	// registering value
	.value('fperson', {
		firstname: "",
		lastname: ""
	})
	// registering service
	.factory('personFactory', PersonFactory)
	.controller('factoryController', function($scope, fperson, personFactory){
		fperson.firstname = "Yagna";
		fperson.lastname = 'Shree';
		
		$scope.fpersonInstance = fperson;
		$scope.personFactoryInstance = personFactory;
	});


///////////////////////////////////////////////////////////////////////////////
// Provider Module
///////////////////////////////////////////////////////////////////////////////	
var PersonProvider = function(){
	return{
		$get: function(pperson){
			return {
				getFirstName: function(){
					return pperson.firstname;
				},
				getLastName: function(){
					return pperson.lastname;
				},
				getFullName: function(seperator){
					return pperson.firstname+seperator+pperson.lastname;
				}
			};
		}
	};
};

// controller definition
angular.module('providerModule', [])
	// registering value
	.value('pperson', {
		firstname: "",
		lastname: ""
	})
	// registering service
	.provider('personProvider', PersonProvider)
	.controller('providerController', function($scope, pperson, personProvider){
		pperson.firstname = 'Yagna';
		pperson.lastname = 'Shree';
		
		$scope.ppersonInstance = pperson;
		$scope.personProviderInstance = personProvider;
	});
	
///////////////////////////////////////////////////////////////////////////////
// Configuration through Provider Module
///////////////////////////////////////////////////////////////////////////////	
var ConfigPersonProvider = function(){
	var seperator = ' ';
	return{
		setSeperator: function(seperatorArg){
			seperator = seperatorArg;
		},
		$get: function(cperson){
			return {
				getFirstName: function(){
					return cperson.firstname;
				},
				getLastName: function(){
					return cperson.lastname;
				},
				getFullName: function(){
					return cperson.firstname+seperator+cperson.lastname;
				}
			};
		}
	};
};

// controller definition
angular.module('configModule', [])
	// registering value
	.value('cperson', {
		firstname: "",
		lastname: ""
	})
	// registering service
	.provider('configPersonProvider', ConfigPersonProvider)
	// config looks fof provider{Provider}, so name would be configPersonProviderProvider
	.config(function(configPersonProviderProvider){
		configPersonProviderProvider.setSeperator('.');
	})
	.controller('configController', function($scope, cperson, configPersonProvider){
		cperson.firstname = 'Yagna';
		cperson.lastname = 'Shree';
		
		$scope.cpersonInstance = cperson;
		$scope.configPersonProviderInstance = configPersonProvider;
	});
	
///////////////////////////////////////////////////////////////////////////////
// Module Dependency
///////////////////////////////////////////////////////////////////////////////	
var DependencyProvider = function(){
	var id = '';
	return {
		setId: function(idArg){
			id = idArg;
		},
		$get: function(){
			return{
				getId: function(){
					return id;
				}				
			};
		}
	};
};

angular.module('child1', [])
	.provider('provider1',DependencyProvider)
	.config(function(provider1Provider){
		provider1Provider.setId('Child1 - Provider1');
	})
	.provider('provider2',DependencyProvider)
	.config(function(provider2Provider){
		provider2Provider.setId('Child1 - Provider2');
	});

angular.module('child2', [])
	.provider('provider3',DependencyProvider)
	.config(function(provider3Provider){
		provider3Provider.setId('Child2 - Provider3');
	})
	.provider('provider4',DependencyProvider)
	.config(function(provider4Provider){
		provider4Provider.setId('Child2 - Provider4');
	});

angular.module('child3', ['child1','child2'])
	.provider('provider1',DependencyProvider)
	.config(function(provider1Provider){
		provider1Provider.setId('Child3 - Provider1');
	})
	.provider('provider4',DependencyProvider)
	.config(function(provider4Provider){
		provider4Provider.setId('Child3 - Provider4');
	})
	.controller('dependencyController',function($scope, provider1, provider2, provider3, provider4){
		$scope.provider1Instance = provider1;
		$scope.provider2Instance = provider2;
		$scope.provider3Instance = provider3;
		$scope.provider4Instance = provider4;		
	});


///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', ['valueModule','serviceModule','factoryModule','providerModule','configModule','child3'])
	.controller('moduleController', function ($scope){
		// Intializing model
		$scope.person = {
			firstname: "Yagna",
			lastname: "Shree",
			
			// function for full name
			fullname: function (){
				return this.firstname + ' ' + this.lastname;
			}
		};
	});