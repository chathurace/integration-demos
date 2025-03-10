import ballerina/http;

listener http:Listener DMartL = new (port = 8082);

service /dmartp on DMartL {
    resource function get outlets() returns json|http:InternalServerError {
        do {
            return ["Colombo", "Galle"];
        } on fail error err {
            // handle error
            panic error("Unhandled error");
        }
    }
}
