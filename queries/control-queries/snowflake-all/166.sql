select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,customer_address a,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 136 and ws.ws_hash <= 886 and a.ca_hash >= 659 and a.ca_hash <= 992 and cd.cd_hash >= 131 and cd.cd_hash <= 531
;
