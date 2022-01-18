select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,date_dim d,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 212 and ws.ws_hash <= 962 and c.c_hash >= 521 and c.c_hash <= 921 and cd.cd_hash >= 521 and cd.cd_hash <= 854
;
