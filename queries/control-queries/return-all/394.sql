select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,date_dim d,web_returns wr
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 508 and ws.ws_hash <= 841 and i.i_hash >= 565 and i.i_hash <= 965 and d.d_hash >= 62 and d.d_hash <= 812
;
