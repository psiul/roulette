select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,web_returns wr,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 180 and ws.ws_hash <= 930 and i.i_hash >= 586 and i.i_hash <= 986 and d.d_hash >= 43 and d.d_hash <= 376
;
