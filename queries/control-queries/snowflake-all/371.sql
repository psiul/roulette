select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,customer c,customer_address a
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 634 and i.i_hash <= 967 and d.d_hash >= 13 and d.d_hash <= 763 and c.c_hash >= 518 and c.c_hash <= 918
;
