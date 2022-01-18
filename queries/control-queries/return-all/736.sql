select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,item i,warehouse w
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 129 and ws.ws_hash <= 529 and hd.hd_hash >= 212 and hd.hd_hash <= 962 and i.i_hash >= 36 and i.i_hash <= 369
;
