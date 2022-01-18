select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,customer_address a,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 477 and ws.ws_hash <= 877 and c.c_hash >= 101 and c.c_hash <= 434 and hd.hd_hash >= 31 and hd.hd_hash <= 781
;
