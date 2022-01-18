select count(ws.ws_item_sk)
from web_sales ws,customer c,ship_mode sm,customer_demographics cd,customer_address a
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 222 and c.c_hash <= 555 and sm.sm_hash >= 12 and sm.sm_hash <= 762 and a.ca_hash >= 153 and a.ca_hash <= 553
;
