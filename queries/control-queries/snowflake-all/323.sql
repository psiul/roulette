select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,customer_demographics cd,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 230 and ws.ws_hash <= 630 and c.c_hash >= 67 and c.c_hash <= 400 and cd.cd_hash >= 209 and cd.cd_hash <= 959
;
