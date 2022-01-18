select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,ship_mode sm,item i,warehouse w
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 150 and ws.ws_hash <= 900 and hd.hd_hash >= 525 and hd.hd_hash <= 925 and sm.sm_hash >= 426 and sm.sm_hash <= 759
;
