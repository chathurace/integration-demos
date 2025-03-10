import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /hmart on httpDefaultListener {
    function init() returns error? {
        do {
        } on fail error err {
            // handle error
            panic error("Unhandled error");
        }
    }

    resource function get outlets() returns json|http:InternalServerError {
        do {
            return ["Brisbane", "Logan", "Sprimgwood"];
        } on fail error err {
            // handle error
            panic error("Unhandled error");
        }
    }
}
