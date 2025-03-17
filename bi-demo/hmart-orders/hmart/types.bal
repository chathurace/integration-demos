
type SalesOrder record {|
    string orderId;
    string customerId;
    string productId;
    int quantity;
|};

type OrderResult record {|
    string orderId;
    string status;
    string shipTo;
|};

type Customer record {|
    string customerId;
    string address;
    string status;
|};

type InventoryResponse record {|
    string orderId;
    string status;
|};

type Invoice record {|
    string orderId;
    string invoiceId;
|};
