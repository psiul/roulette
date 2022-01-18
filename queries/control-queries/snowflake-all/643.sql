select count(ws.ws_item_sk)
from web_sales ws,customer c,ship_mode sm,customer_address a,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 181 and ws.ws_hash <= 931 and sm.sm_hash >= 63 and sm.sm_hash <= 463 and cd.cd_hash >= 45 and cd.cd_hash <= 378
;
