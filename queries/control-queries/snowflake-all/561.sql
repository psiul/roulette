select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_address a,customer_demographics cd,ship_mode sm
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 386 and ws.ws_hash <= 786 and c.c_hash >= 80 and c.c_hash <= 413 and a.ca_hash >= 192 and a.ca_hash <= 942
;
