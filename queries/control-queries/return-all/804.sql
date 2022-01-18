select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 210 and ws.ws_hash <= 960 and c.c_hash >= 69 and c.c_hash <= 402 and hd.hd_hash >= 48 and hd.hd_hash <= 448
;
