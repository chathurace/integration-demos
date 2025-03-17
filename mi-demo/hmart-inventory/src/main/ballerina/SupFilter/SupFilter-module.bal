import wso2/mi;
import ballerina/io;

@mi:Operation
public function selectSup(json supplier) returns json {
    io:println(supplier);
    return {sup: "s1"};
}