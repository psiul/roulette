select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,ship_mode sm,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 33 and ws.ws_hash <= 366 and sm.sm_hash >= 47 and sm.sm_hash <= 447 and cd.cd_hash >= 0 and cd.cd_hash <= 750
;
