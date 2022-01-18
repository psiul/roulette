select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,web_returns wr,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 126 and ws.ws_hash <= 526 and d.d_hash >= 188 and d.d_hash <= 521 and i.i_hash >= 191 and i.i_hash <= 941
;
