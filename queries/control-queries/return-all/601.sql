select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,item i,customer c
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 646 and ws.ws_hash <= 979 and cd.cd_hash >= 127 and cd.cd_hash <= 877 and i.i_hash >= 511 and i.i_hash <= 911
;
