select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,date_dim d,web_returns wr
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 262 and ws.ws_hash <= 662 and sm.sm_hash >= 580 and sm.sm_hash <= 913 and d.d_hash >= 185 and d.d_hash <= 935
;
