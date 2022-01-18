select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,customer_demographics cd,customer_address a
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 15 and c.c_hash <= 348 and d.d_hash >= 159 and d.d_hash <= 909 and a.ca_hash >= 417 and a.ca_hash <= 817
;
