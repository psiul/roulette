select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,item i,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 109 and ws.ws_hash <= 442 and sm.sm_hash >= 38 and sm.sm_hash <= 438 and i.i_hash >= 115 and i.i_hash <= 865
;
