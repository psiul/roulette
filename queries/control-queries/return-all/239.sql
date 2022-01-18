select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,customer c,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_refunded_customer_sk = c.c_customer_sk and wr.wr_item_sk = i.i_item_sk and ws.ws_hash >= 91 and ws.ws_hash <= 841 and c.c_hash >= 46 and c.c_hash <= 446 and i.i_hash >= 222 and i.i_hash <= 555
;
