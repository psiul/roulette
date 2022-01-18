select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,date_dim d,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and sm.sm_hash >= 280 and sm.sm_hash <= 613 and d.d_hash >= 378 and d.d_hash <= 778 and hd.hd_hash >= 165 and hd.hd_hash <= 915
;
