select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,ship_mode sm,customer_demographics cd,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 329 and ws.ws_hash <= 729 and cd.cd_hash >= 82 and cd.cd_hash <= 415 and c.c_hash >= 186 and c.c_hash <= 936
;
