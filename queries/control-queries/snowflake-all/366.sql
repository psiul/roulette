select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,customer_demographics cd,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 12 and ws.ws_hash <= 762 and sm.sm_hash >= 160 and sm.sm_hash <= 560 and hd.hd_hash >= 376 and hd.hd_hash <= 709
;
