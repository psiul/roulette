select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,customer c,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 402 and ws.ws_hash <= 735 and d.d_hash >= 201 and d.d_hash <= 951 and cd.cd_hash >= 434 and cd.cd_hash <= 834
;
