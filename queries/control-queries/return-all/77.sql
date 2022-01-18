select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,warehouse w,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 216 and ws.ws_hash <= 549 and sm.sm_hash >= 393 and sm.sm_hash <= 793 and hd.hd_hash >= 81 and hd.hd_hash <= 831
;
