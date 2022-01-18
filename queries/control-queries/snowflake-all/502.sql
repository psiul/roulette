select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,date_dim d,ship_mode sm
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 562 and ws.ws_hash <= 895 and d.d_hash >= 461 and d.d_hash <= 861 and sm.sm_hash >= 163 and sm.sm_hash <= 913
;
