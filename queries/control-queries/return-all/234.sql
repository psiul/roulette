select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,customer c,web_returns wr,customer_address a
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 469 and ws.ws_hash <= 802 and c.c_hash >= 213 and c.c_hash <= 963 and a.ca_hash >= 29 and a.ca_hash <= 429
;
