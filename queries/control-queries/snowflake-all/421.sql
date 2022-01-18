select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,household_demographics hd,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 179 and ws.ws_hash <= 512 and sm.sm_hash >= 157 and sm.sm_hash <= 907 and cd.cd_hash >= 400 and cd.cd_hash <= 800
;
