select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,item i,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 80 and ws.ws_hash <= 413 and d.d_hash >= 595 and d.d_hash <= 995 and sm.sm_hash >= 172 and sm.sm_hash <= 922
;
