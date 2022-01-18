select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,household_demographics hd,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 517 and ws.ws_hash <= 917 and sm.sm_hash >= 428 and sm.sm_hash <= 761 and hd.hd_hash >= 230 and hd.hd_hash <= 980
;
