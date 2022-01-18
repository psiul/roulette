select count(ws.ws_item_sk)
from web_sales ws,customer c,ship_mode sm,customer_demographics cd,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 84 and ws.ws_hash <= 834 and c.c_hash >= 34 and c.c_hash <= 367 and sm.sm_hash >= 63 and sm.sm_hash <= 463
;
