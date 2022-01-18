select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,warehouse w,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 171 and ws.ws_hash <= 921 and sm.sm_hash >= 115 and sm.sm_hash <= 515 and d.d_hash >= 472 and d.d_hash <= 805
;
