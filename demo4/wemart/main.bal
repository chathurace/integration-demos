import ballerina/http;

listener http:Listener WeMartL = new (port = 8093);

service /wemart on WeMartL {
    resource function post orders(@http:Payload SalesOrder payload) returns json|http:InternalServerError {
        do {

        } on fail error err {
            // handle error
            panic error("Unhandled error");
        }
    }
}
