select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,web_returns wr,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_item_sk = i.i_item_sk and ws.ws_hash >= 176 and ws.ws_hash <= 509 and c.c_hash >= 158 and c.c_hash <= 908 and d.d_hash >= 483 and d.d_hash <= 883
;
