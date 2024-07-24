public class AnimalLocator {
    private static final String ENDPOINT_URL =  'https://th-apex-http-callout.herokuapp.com/animals/{0}';
    public static String getAnimalNameById(Integer id){
        String result = '';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(ENDPOINT_URL.replace('{0}',String.valueOf(id)));
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        result = res.getBody();
        Map<String,Object> resultMap = (Map<String,Object>) JSON.deserializeUntyped(result);Map<String,Object> animalMap = (Map<String,Object>) resultMap.get('animal');
        result = (String) animalMap.get('name');
        return result;
    }
}