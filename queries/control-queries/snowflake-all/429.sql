select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,household_demographics hd,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and i.i_hash >= 373 and i.i_hash <= 706 and sm.sm_hash >= 149 and sm.sm_hash <= 899 and hd.hd_hash >= 580 and hd.hd_hash <= 980
;
