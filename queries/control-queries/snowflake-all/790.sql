select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,household_demographics hd,ship_mode sm,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and cd.cd_hash >= 155 and cd.cd_hash <= 555 and sm.sm_hash >= 343 and sm.sm_hash <= 676 and i.i_hash >= 69 and i.i_hash <= 819
;
