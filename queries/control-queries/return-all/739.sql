select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer c,web_returns wr
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 9 and ws.ws_hash <= 759 and i.i_hash >= 539 and i.i_hash <= 872 and c.c_hash >= 562 and c.c_hash <= 962
;
