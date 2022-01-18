select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,ship_mode sm,household_demographics hd,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 578 and ws.ws_hash <= 911 and cd.cd_hash >= 34 and cd.cd_hash <= 784 and sm.sm_hash >= 46 and sm.sm_hash <= 446
;
