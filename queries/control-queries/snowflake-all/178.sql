select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,household_demographics hd,ship_mode sm,customer c
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and cd.cd_hash >= 3 and cd.cd_hash <= 336 and hd.hd_hash >= 387 and hd.hd_hash <= 787 and sm.sm_hash >= 90 and sm.sm_hash <= 840
;
