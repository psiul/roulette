select count(ws.ws_item_sk)
from web_sales ws,item i,customer c,customer_demographics cd,customer_address a
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 451 and i.i_hash <= 851 and cd.cd_hash >= 163 and cd.cd_hash <= 913 and a.ca_hash >= 230 and a.ca_hash <= 563
;
