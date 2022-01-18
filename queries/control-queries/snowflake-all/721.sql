select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer c,ship_mode sm,customer_demographics cd
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 542 and c.c_hash <= 875 and sm.sm_hash >= 419 and sm.sm_hash <= 819 and cd.cd_hash >= 148 and cd.cd_hash <= 898
;
