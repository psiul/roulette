select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,warehouse w,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 19 and ws.ws_hash <= 769 and sm.sm_hash >= 412 and sm.sm_hash <= 812 and i.i_hash >= 660 and i.i_hash <= 993
;
