select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,household_demographics hd,ship_mode sm
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 314 and ws.ws_hash <= 714 and d.d_hash >= 157 and d.d_hash <= 907 and hd.hd_hash >= 663 and hd.hd_hash <= 996
;
