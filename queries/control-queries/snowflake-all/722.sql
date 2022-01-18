select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,ship_mode sm,customer_address a
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 390 and cd.cd_hash <= 723 and sm.sm_hash >= 93 and sm.sm_hash <= 843 and a.ca_hash >= 575 and a.ca_hash <= 975
;
