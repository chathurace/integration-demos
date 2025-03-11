type SalesOrder record {|
    string orderId;
    string customerId;
    string productId;
    int quantity;
|};

type Customer record {|
    string customerId;
    string address;
    boolean blocked;
|};

type ShipmentStatus record {|
    string orderId;
    string status;
|};

