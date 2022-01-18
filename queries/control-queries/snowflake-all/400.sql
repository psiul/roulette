select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,warehouse w,ship_mode sm
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 203 and ws.ws_hash <= 953 and d.d_hash >= 463 and d.d_hash <= 863 and sm.sm_hash >= 63 and sm.sm_hash <= 396
;
