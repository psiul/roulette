select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,customer_address a,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 210 and ws.ws_hash <= 960 and d.d_hash >= 146 and d.d_hash <= 546 and a.ca_hash >= 161 and a.ca_hash <= 494
;
