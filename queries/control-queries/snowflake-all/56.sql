select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,customer_address a,ship_mode sm
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 248 and ws.ws_hash <= 998 and c.c_hash >= 338 and c.c_hash <= 671 and a.ca_hash >= 318 and a.ca_hash <= 718
;
