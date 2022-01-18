select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer c,customer_address a
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 495 and ws.ws_hash <= 828 and d.d_hash >= 478 and d.d_hash <= 878 and c.c_hash >= 196 and c.c_hash <= 946
;
