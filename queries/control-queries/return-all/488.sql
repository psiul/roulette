select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer c,customer_address a,customer_demographics cd
where ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 138 and ws.ws_hash <= 471 and c.c_hash >= 304 and c.c_hash <= 704 and a.ca_hash >= 215 and a.ca_hash <= 965
;
