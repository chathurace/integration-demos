import ballerina/http;

listener http:Listener dmartListener = new (port = 8081);

service /kmart on dmartListener {
    resource function get outlets() returns json|http:InternalServerError {
        do {
            return ["Colombo", "Gampaha", "Galle"];
        } on fail error err {
            // handle error
            panic error("Unhandled error");
        }
    }
}
