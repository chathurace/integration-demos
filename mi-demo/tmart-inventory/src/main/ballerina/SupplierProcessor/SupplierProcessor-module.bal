import wso2/mi;
import ballerina/io;

@mi:Operation
public function selectSupplier(json sups) returns json {
    io:println(sups);
    return {status: "Supplier selected"};
}