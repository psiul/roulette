select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,ship_mode sm,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 85 and ws.ws_hash <= 485 and c.c_hash >= 307 and c.c_hash <= 640 and cd.cd_hash >= 31 and cd.cd_hash <= 781
;
