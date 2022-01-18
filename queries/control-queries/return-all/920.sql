select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_address a,item i,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and c.c_hash >= 38 and c.c_hash <= 788 and i.i_hash >= 558 and i.i_hash <= 891 and d.d_hash >= 273 and d.d_hash <= 673
;
