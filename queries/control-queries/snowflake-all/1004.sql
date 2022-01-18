select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,warehouse w,ship_mode sm
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 485 and ws.ws_hash <= 885 and i.i_hash >= 242 and i.i_hash <= 575 and sm.sm_hash >= 202 and sm.sm_hash <= 952
;
