select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,warehouse w,customer_address a
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 14 and ws.ws_hash <= 764 and cd.cd_hash >= 411 and cd.cd_hash <= 811 and a.ca_hash >= 566 and a.ca_hash <= 899
;
