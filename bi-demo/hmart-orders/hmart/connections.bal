import ballerina/http;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;

final mysql:Client CustomerDB = check new (password = "cce123", database = "gmart");
final http:Client InventoryEp = check new ("http://localhost:8091/inventory/");
final http:Client invoiceService = check new ("http://localhost:8091/inventory/products/p1");
