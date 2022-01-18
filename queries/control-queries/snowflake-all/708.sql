select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,household_demographics hd,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 302 and ws.ws_hash <= 702 and hd.hd_hash >= 164 and hd.hd_hash <= 914 and d.d_hash >= 114 and d.d_hash <= 447
;
