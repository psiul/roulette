select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,ship_mode sm,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 403 and d.d_hash <= 736 and sm.sm_hash >= 292 and sm.sm_hash <= 692 and hd.hd_hash >= 178 and hd.hd_hash <= 928
;
