import ballerina/http;
import ballerina/io;

listener http:Listener httpDefaultListener = http:getDefaultListener();

listener http:Listener HMartL = new (port = 9091);

service /shop on HMartL {
    resource function post orders(@http:Payload SalesOrder salesOrder) returns map<json>|error {
        do {

            Customer customer = check CustomerDB->queryRow(`SELECT * FROM customers WHERE customerId=${salesOrder.customerId}`);
            if customer.status == "BLOCKED" {
                return {orderId: salesOrder.orderId, customer: salesOrder.customerId, status: "Customer blocked."};
            }
            InventoryResponse reservationResult = check InventoryEp->post("reservation", {
                "order": salesOrder.orderId,
                product: salesOrder.productId,
                amount: salesOrder.quantity

            });
            fork {
                worker invoiceFlow returns error? {
                    Invoice invoice = check invoiceService->post("invoices", {
                        orderId: salesOrder.orderId
                    });
                }
                worker shipmentFlow returns error? {
                    check io:fileWriteCsv("/Users/chathura/work/projects/demos/integration-demos/temp/shipments/s1.csv", [[salesOrder.orderId, customer.address]], io:APPEND);
                }
            }
            map<any|error> waitResult = wait {inr: invoiceFlow, shr: shipmentFlow};

            return {orderId: salesOrder.orderId, status: "Processed"};
        } on fail error err {
            // handle error
            return error("Not implemented", err);
        }
    }
}

public type OResult record {|
    *http:Ok;
    OrderResult body;
|};
