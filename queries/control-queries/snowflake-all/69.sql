select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,ship_mode sm,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 105 and ws.ws_hash <= 855 and d.d_hash >= 264 and d.d_hash <= 664 and hd.hd_hash >= 660 and hd.hd_hash <= 993
;
