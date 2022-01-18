select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,customer_demographics cd,customer_address a
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 357 and c.c_hash <= 690 and hd.hd_hash >= 146 and hd.hd_hash <= 896 and a.ca_hash >= 413 and a.ca_hash <= 813
;
