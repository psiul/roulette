select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,item i,customer c
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 182 and ws.ws_hash <= 515 and cd.cd_hash >= 47 and cd.cd_hash <= 797 and c.c_hash >= 496 and c.c_hash <= 896
;
