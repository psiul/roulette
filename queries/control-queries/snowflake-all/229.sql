select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,item i,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and sm.sm_hash >= 187 and sm.sm_hash <= 587 and i.i_hash >= 189 and i.i_hash <= 939 and hd.hd_hash >= 448 and hd.hd_hash <= 781
;
