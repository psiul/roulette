select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,customer_address a,warehouse w
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 15 and ws.ws_hash <= 415 and c.c_hash >= 463 and c.c_hash <= 796 and a.ca_hash >= 217 and a.ca_hash <= 967
;
