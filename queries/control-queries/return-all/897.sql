select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,item i,web_returns wr
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 122 and ws.ws_hash <= 872 and c.c_hash >= 185 and c.c_hash <= 518 and i.i_hash >= 308 and i.i_hash <= 708
;
