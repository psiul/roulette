select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,customer c,item i,date_dim d
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 69 and ws.ws_hash <= 469 and c.c_hash >= 250 and c.c_hash <= 583 and i.i_hash >= 199 and i.i_hash <= 949
;
