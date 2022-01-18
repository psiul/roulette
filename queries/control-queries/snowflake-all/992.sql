select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,customer c,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and cd.cd_hash >= 82 and cd.cd_hash <= 415 and c.c_hash >= 44 and c.c_hash <= 794 and i.i_hash >= 127 and i.i_hash <= 527
;
