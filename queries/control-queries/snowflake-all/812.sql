select count(ws.ws_item_sk)
from web_sales ws,item i,customer c,date_dim d,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 218 and i.i_hash <= 968 and c.c_hash >= 107 and c.c_hash <= 440 and cd.cd_hash >= 30 and cd.cd_hash <= 430
;
