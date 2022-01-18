select count(ws.ws_item_sk)
from web_sales ws,customer c,item i,date_dim d,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 70 and ws.ws_hash <= 820 and c.c_hash >= 404 and c.c_hash <= 804 and cd.cd_hash >= 533 and cd.cd_hash <= 866
;
