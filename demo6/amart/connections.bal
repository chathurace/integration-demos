import ballerina/http;

final http:Client crm = check new ("http://localhost:8092/crm/");
final http:Client shipmentService = check new ("http://localhost:8093/shipments/");
