import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /kmart on httpDefaultListener {
    resource function get outlets() returns json|http:InternalServerError {
        do {
            return ["Colombo", "Gampaha", "Galle"];
        } on fail error err {
            // handle error
            panic error("Unhandled error");
        }
    }
}
