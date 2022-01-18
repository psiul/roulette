select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer c,customer_address a,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_ship_date_sk = d.d_date_sk and hd.hd_hash >= 563 and hd.hd_hash <= 896 and a.ca_hash >= 98 and a.ca_hash <= 848 and d.d_hash >= 217 and d.d_hash <= 617
;
