select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,customer c,customer_address a
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 85 and ws.ws_hash <= 418 and hd.hd_hash >= 544 and hd.hd_hash <= 944 and c.c_hash >= 81 and c.c_hash <= 831
;
