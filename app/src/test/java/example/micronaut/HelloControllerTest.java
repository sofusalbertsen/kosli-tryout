package example.micronaut;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import io.micronaut.http.HttpRequest;
import io.micronaut.http.client.RxHttpClient;
import io.micronaut.http.client.annotation.Client;
import io.micronaut.test.annotation.MicronautTest;
import org.junit.jupiter.api.Test;

import javax.inject.Inject;

@MicronautTest 
public class HelloControllerTest {

    @Inject
    @Client("/")
    RxHttpClient client; 
    //Test spins up an entire server and client to perform the test
    
    @Test
    public void testHello() {
        HttpRequest<String> request = HttpRequest.GET("/hello/sofus"); 
        String body = client.toBlocking().retrieve(request);

        assertNotNull(body);
        assertEquals("Hello sofus", body);
    }
    @Test
    public void testCombineName() {
        String name = "Sonny";
        HelloController sut = new HelloController();
        System.out.println("testing");
        assertEquals("Hello "+name, sut.combineName(name),"Name and greeting not properly combined");
        
        
    }

    @Test
    public void testIndexWithDifferentNames() {
        HttpRequest<String> request1 = HttpRequest.GET("/hello/Alice");
        String response1 = client.toBlocking().retrieve(request1);
        assertEquals("Hello Alice", response1);

        HttpRequest<String> request2 = HttpRequest.GET("/hello/Bob");
        String response2 = client.toBlocking().retrieve(request2);
        assertEquals("Hello Bob", response2);

        HttpRequest<String> request3 = HttpRequest.GET("/hello/");
        // This will likely result in a 404 or error, depending on routing config
        // Uncomment below if you want to check for error handling
        // assertThrows(HttpClientResponseException.class, () -> client.toBlocking().retrieve(request3));
    }

    @Test
    public void testCombineNameWithNull() {
        HelloController sut = new HelloController();
        String result = sut.combineName(null);
        assertEquals("Hello null", result);
    }

    @Test
    public void testCombineNameWithEmptyString() {
        HelloController sut = new HelloController();
        String result = sut.combineName("");
        assertEquals("Hello ", result);
    }



}