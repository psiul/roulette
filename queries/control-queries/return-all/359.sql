select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,warehouse w,ship_mode sm
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 425 and ws.ws_hash <= 825 and i.i_hash >= 128 and i.i_hash <= 878 and hd.hd_hash >= 459 and hd.hd_hash <= 792
;
