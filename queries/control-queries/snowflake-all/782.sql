select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,customer_address a,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_item_sk = i.i_item_sk and c.c_hash >= 3 and c.c_hash <= 753 and hd.hd_hash >= 636 and hd.hd_hash <= 969 and i.i_hash >= 90 and i.i_hash <= 490
;
