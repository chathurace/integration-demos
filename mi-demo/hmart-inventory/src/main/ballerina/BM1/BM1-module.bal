import wso2/mi;
import ballerina/io;

@mi:Operation
public function supSelect(json ss1) returns json {
    io:println(ss1);
    return {status: "Selected"};
}