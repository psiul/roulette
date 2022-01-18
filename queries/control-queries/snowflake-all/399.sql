select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,item i,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 289 and ws.ws_hash <= 622 and i.i_hash >= 585 and i.i_hash <= 985 and sm.sm_hash >= 213 and sm.sm_hash <= 963
;
