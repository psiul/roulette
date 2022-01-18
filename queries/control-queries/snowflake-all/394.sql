select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_address a,household_demographics hd,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and a.ca_hash >= 149 and a.ca_hash <= 899 and hd.hd_hash >= 509 and hd.hd_hash <= 842 and d.d_hash >= 231 and d.d_hash <= 631
;
