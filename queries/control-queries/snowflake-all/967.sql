select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 420 and ws.ws_hash <= 753 and c.c_hash >= 108 and c.c_hash <= 508 and cd.cd_hash >= 17 and cd.cd_hash <= 767
;
