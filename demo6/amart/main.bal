import ballerina/http;

listener http:Listener amartL = new (9095);

service /amart on amartL {
    resource function post orders(@http:Payload SalesOrder salesOrder) returns json|http:InternalServerError {
        do {
            Customer customer = check crm->get("customers/" + salesOrder.customerId);
            if customer.blocked {
                return {orderId: salesOrder.orderId, customer: salesOrder.customerId, status: "Blocked"};
            }
            ShipmentStatus shipStatus = check shipmentService->post("outbound", {orderId: salesOrder.orderId, address: customer.address});
            return {orderId: salesOrder.orderId, status: shipStatus.status};
        } on fail error err {
            // handle error
            panic error("Unhandled error");
        }
    }
}
