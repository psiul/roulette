select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer c,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 186 and ws.ws_hash <= 936 and c.c_hash >= 144 and c.c_hash <= 477 and cd.cd_hash >= 544 and cd.cd_hash <= 944
;
