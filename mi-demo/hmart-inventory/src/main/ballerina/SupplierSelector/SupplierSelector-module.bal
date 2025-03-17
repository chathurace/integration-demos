import wso2/mi;
import ballerina/io;

@mi:Operation
public function calculateTotal(json suppliers) returns json {
    io:println(suppliers);
    if suppliers is json[] {
        json s = suppliers[0];
        return s;
    }
    return {status: "Not an array"};
}