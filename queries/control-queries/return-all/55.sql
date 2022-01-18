select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,date_dim d,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and sm.sm_hash >= 107 and sm.sm_hash <= 440 and d.d_hash >= 79 and d.d_hash <= 479 and i.i_hash >= 36 and i.i_hash <= 786
;
