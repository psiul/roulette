select count(ws.ws_item_sk)
from web_sales ws,item i,customer c,web_returns wr,customer_address a
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 397 and i.i_hash <= 730 and c.c_hash >= 26 and c.c_hash <= 776 and a.ca_hash >= 242 and a.ca_hash <= 642
;
