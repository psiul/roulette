select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,item i,ship_mode sm
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 232 and ws.ws_hash <= 982 and d.d_hash >= 548 and d.d_hash <= 881 and sm.sm_hash >= 77 and sm.sm_hash <= 477
;
