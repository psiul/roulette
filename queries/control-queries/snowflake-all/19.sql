select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,customer_demographics cd,customer_address a
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 577 and ws.ws_hash <= 910 and c.c_hash >= 36 and c.c_hash <= 786 and cd.cd_hash >= 140 and cd.cd_hash <= 540
;
