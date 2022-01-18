select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,customer_address a,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_item_sk = i.i_item_sk and c.c_hash >= 253 and c.c_hash <= 653 and cd.cd_hash >= 586 and cd.cd_hash <= 919 and a.ca_hash >= 215 and a.ca_hash <= 965
;
