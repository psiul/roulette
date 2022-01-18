select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,item i,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 116 and ws.ws_hash <= 449 and cd.cd_hash >= 98 and cd.cd_hash <= 498 and i.i_hash >= 171 and i.i_hash <= 921
;
