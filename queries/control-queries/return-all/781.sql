select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,web_returns wr,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 33 and ws.ws_hash <= 366 and i.i_hash >= 281 and i.i_hash <= 681 and d.d_hash >= 168 and d.d_hash <= 918
;
