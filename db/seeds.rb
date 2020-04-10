require 'rest-client'
destinations = JSON.parse(RestClient.get('https://restcountries.eu/rest/v2/all'))

destinations.each do |country|
    if country['name'] != "South Sudan" #The ER tracker does not have the South Sudan Pound Available, and the Countries API lists no alternate Currencies
        if country['name'] === "Antarctica" || country['name'] === "Virgin Islands (British)" || country['name'] === "Micronesia (Federated States of)" || country['name'] === "Palau" || country['name'] === "Singapore"
            Country.create(name: country['name'], currency_code: country['currencies'][1]['code'], currency_name: country['currencies'][1]['name'])
        elsif country['name'] === "Zimbabwe"
            Country.create(name: country['name'], currency_code: country['currencies'][7]['code'], currency_name: country['currencies'][7]['name'])
        else
            Country.create(name: country['name'], currency_code: country['currencies'][0]['code'], currency_name: country['currencies'][0]['name'])    
        end
    end 
end