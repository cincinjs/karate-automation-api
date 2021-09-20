function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    baseURL : 'https://jsonplaceholder.typicode.com/'

  }
  if (env == 'dev') {
    config.baseURL = 'https://jsonplaceholder.typicode.com/';

  } else if (env == 'e2e') {
    config.baseURL = 'https://jsonplaceholder.typicode.com/';

  }
  return config;
}