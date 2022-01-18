select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,ship_mode sm,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 276 and ws.ws_hash <= 676 and sm.sm_hash >= 572 and sm.sm_hash <= 905 and hd.hd_hash >= 154 and hd.hd_hash <= 904
;
