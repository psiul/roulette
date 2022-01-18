select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,date_dim d,warehouse w
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and sm.sm_hash >= 215 and sm.sm_hash <= 965 and hd.hd_hash >= 519 and hd.hd_hash <= 852 and d.d_hash >= 566 and d.d_hash <= 966
;
