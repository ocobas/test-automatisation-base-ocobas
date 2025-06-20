function ruTest() {
    var env = karate.env;
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }
    karate.configure('ssl', true);
    var config = {
        env: env,
        baseUrl: 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/',
    }
    return config;
}
