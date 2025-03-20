public class JSONPlaceholderExercise {
    private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';
    
    /**
     * Exercise 1: Implement a GET request to fetch a post by ID
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to fetch
     * @return String - The JSON response from the API
     */
    public static String getPostById(Integer postId) {
        // TODO: Student Implementation
        Http http = new http();
        // 1. Create a new HTTP request
        HttpRequest request = new HttpRequest();
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        request.setEndpoint('callout:JsonPlaceholder/posts/'+postId);
        // 3. Set the HTTP method to 'GET'
        request.setMethod('GET');
        // Challenge #2 - Implement request timeouts
        request.setTimeout(5000);
        try{
            // 4. Send the request and get the response    
            HttpResponse response = http.send(request);
            // Challenge #1 - Add error handling for non-200 status codes
            if(response.getStatusCode() >= 200 && response.getStatusCode() <= 300){
                // 5. Return the response body as string
                return response.getBody();
            }else{
                // Challenge #4 - Create custom exception classes
                // Throw exception if status code is non-200s
                throw new MyCustomCalloutException('Something bad happened');
            }
        }catch(MyCustomCalloutException e){
            System.debug('Custom Exception: ' + e.getMessage());
            return 'Error - ' + e.getMessage();
        }catch(CalloutException e){
            System.debug('Callout Exception: ' + e.getMessage());
            return 'Error - Callout Exception - ' + e.getMessage();
        }catch(Exception e){
            System.debug('Unexpected Exception: ' + e.getMessage());
            return 'Error - Unexpected Error Occurred: ' + e.getMessage();
        }        
    }
    
    /**
     * Exercise 2: Implement a POST request to create a new post
     * Endpoint: /posts
     * @param title - The title of the post
     * @param body - The body content of the post
     * @param userId - The user ID creating the post
     * @return String - The JSON response from the API
     */
    public static String createPost(String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP 
        HttpRequest request = new HttpRequest();
        // 2. Set the endpoint URL using BASE_URL + '/posts'
        request.setEndpoint('callout:JsonPlaceholder/posts');
        // 3. Set the HTTP method to 'POST'
        request.setMethod('POST');
        // 4. Create a JSON string with the post data
        Map<String, String> bodyMap = new Map<String, String>{'title' => 'My Life Story', 'body' => 'TL/DR', 'userId' => '1'};
        String jsonString = JSON.serialize(bodyMap);
        // 5. Set the request body
        request.setBody(jsonString);
        Http http = new http();
        try{ 
            HttpResponse response = http.send(request);
            // Challenge #1 - Add error handling for non-200 status codes
            if(response.getStatusCode() >= 200 && response.getStatusCode() <= 300){
                // 5. Return the response body as string
                return response.getBody();
            }else{
                // Challenge #4 - Create custom exception classes
                // Throw exception if status code is non-200s
                throw new MyCustomCalloutException('Something bad happened');
            }
        }catch(MyCustomCalloutException e){
            System.debug('Custom Exception: ' + e.getMessage());
            return 'Error - ' + e.getMessage();
        }catch(CalloutException e){
            System.debug('Callout Exception: ' + e.getMessage());
            return 'Error - Callout Exception - ' + e.getMessage();
        }catch(Exception e){
            System.debug('Unexpected Exception: ' + e.getMessage());
            return 'Error - Unexpected Error Occurred: ' + e.getMessage();
        }        
    }
    
    /**
     * Exercise 3: Implement a PUT request to update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to update
     * @param title - The new title
     * @param body - The new body content
     * @param userId - The user ID
     * @return String - The JSON response from the API
     */
    public static String updatePost(Integer postId, String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        HttpRequest request = new HttpRequest();
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        request.setEndpoint('callout:JsonPlaceholder/posts/'+postId);
        // 3. Set the HTTP method to 'PUT'
        request.setMethod('PUT');
        // 4. Create a JSON string with the updated post data
        String payload = '{"id":'+postId+'"title":'+title+'"body":'+body+'"userId":'+userId+'}';
        // 5. Set the request body
        request.setBody(payload);
        // 6. Send the request and get the response
        Http http = new http();
        HttpResponse response = http.send(request);
        // 7. Return the response body as string
        return response.getBody();
    }
    
    /**
     * Exercise 4: Implement a PATCH request to partially update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to patch
     * @param title - The new title (can be null)
     * @return String - The JSON response from the API
     */
    public static String patchPostTitle(Integer postId, String title) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        HttpRequest request = new HttpRequest();
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        request.setEndpoint('callout:JsonPlaceholder/posts/'+postId);
        // 3. Set the HTTP method to 'PATCH'
        request.setMethod('PATCH');
        // 4. Create a JSON string with only the title
        String payload = '{"title": "New Title"}';
        // 5. Set the request body
        request.setBody(payload);
        // 6. Send the request and get the response
        Http http = new http();
        HttpResponse response = http.send(request);
        // 7. Return the response body as string
        return response.getBody();
    }
    
    /**
     * Exercise 5: Implement a DELETE request to remove a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to delete
     * @return Integer - The HTTP status code from the response
     */
    public static Integer deletePost(Integer postId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        HttpRequest request = new HttpRequest();
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + 
        request.setEndpoint('callout:JsonPlaceholder/posts/');
        // 3. Set the HTTP method to 'DELETE'
        request.setMethod('DELETE');
        // 4. Send the request and get the response
        Http http = new http();
        HttpResponse response = http.send(request);
        // 5. Return the response status code
        return response.getStatusCode();
    }
} 