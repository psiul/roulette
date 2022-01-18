select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,customer c,customer_address a
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 472 and ws.ws_hash <= 872 and c.c_hash >= 80 and c.c_hash <= 830 and a.ca_hash >= 430 and a.ca_hash <= 763
;
