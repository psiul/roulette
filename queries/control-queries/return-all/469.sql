select count(ws.ws_item_sk)
from web_sales ws,item i,customer c,customer_demographics cd,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 363 and ws.ws_hash <= 696 and i.i_hash >= 239 and i.i_hash <= 989 and cd.cd_hash >= 83 and cd.cd_hash <= 483
;
