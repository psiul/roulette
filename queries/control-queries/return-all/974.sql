select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,customer_demographics cd,customer_address a
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 35 and ws.ws_hash <= 435 and sm.sm_hash >= 112 and sm.sm_hash <= 445 and a.ca_hash >= 214 and a.ca_hash <= 964
;
