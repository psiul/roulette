select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,ship_mode sm,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 556 and ws.ws_hash <= 889 and i.i_hash >= 18 and i.i_hash <= 768 and sm.sm_hash >= 503 and sm.sm_hash <= 903
;
