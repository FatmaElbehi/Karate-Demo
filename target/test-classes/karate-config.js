function fn() {
	karate.configure('connectTimeout', 5000)
	karate.configure('readTimeout', 5000)
	
	var env = karate.env
	karate.log('The value of env is: ',env)
		
  var config =  {
    apiKey: 'free_user_3LYAoqR4PGHCsu7AhvGSS1zBZiM',
	baseUrl: 'https://reqres.in/api'
  };
  
  
  if(env == 'qa'){
  		config.baseUrl= 'https://reqres.in/api/qa'
  	}
  else if(env == 'dev'){
  		config.baseUrl= 'https://reqres.in/api/dev'
  }
  else{
  		config.baseUrl= 'https://reqres.in/api'
  }
  
  return config

}