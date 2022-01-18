select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,household_demographics hd,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 7 and ws.ws_hash <= 757 and hd.hd_hash >= 176 and hd.hd_hash <= 509 and i.i_hash >= 537 and i.i_hash <= 937
;
