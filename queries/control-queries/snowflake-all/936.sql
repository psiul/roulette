select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,customer c,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 204 and ws.ws_hash <= 954 and sm.sm_hash >= 355 and sm.sm_hash <= 688 and hd.hd_hash >= 112 and hd.hd_hash <= 512
;
